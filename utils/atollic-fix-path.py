#!/usr/bin/env python3

import os, sys, re, shutil
import xml.etree.ElementTree as ET

USAGE=" <project root>"

##### PROJECT CONFIG #####
PATH_VAR={
    'ROOT': os.path.realpath('.')
}

RESOURCES = ['Middlewares', 'Drivers']
DL_FW_PATH = "/data/long-term-storage/STM32Cube/Repository"
##########################

# ------- Utils --------
def search_file(name : str, searchPath : str) -> str:
    ret = None

    if not os.path.exists(searchPath):
        print("ERROR: search path does not exist: " + searchPath)
        return None
    
    for root, _, files in os.walk(searchPath):
        if name in files:
            ret = os.path.join(root, name)

    return ret

def atollic_relpath(dest : str, src : str):
    return "PARENT-" + str(os.path.relpath(dest, src).count("..")) + "-PROJECT_LOC"

def atollic_variable(string : str):
    return "$%7B" + string + "%7D"

def get_fw_code(missingFilePath : str, fwRepo : str):
    fileName = os.path.basename(missingFilePath)
    downloadedFw = search_file(fileName, fwRepo)

    if not os.path.exists(os.path.dirname(missingFilePath)):
        os.makedirs(os.path.dirname(missingFilePath))

    shutil.copy(downloadedFw, missingFilePath)

# ------- base XML --------
class AtollicXml:
    def __init__(self, projectFilePath : str):
        self.path   = projectFilePath
        self.xml    = ET.parse(projectFilePath)

    def update_project_file(self):
        self.xml.write(self.path)

# ------- .project --------
class Atollic_Project (AtollicXml):
    def __init__ (self, projectFilePath : str):
        AtollicXml.__init__(self, projectFilePath)

    def relocate_linkedResources(self, resources : list, newLocation : str, fwRepo = ""):
        for link in self.xml.find('linkedResources'):
            uri = link.find('locationURI')
            for r in resources:
                idx = uri.text.find(r)
                if idx != -1: 
                    file = uri.text[idx:]
                    if (not os.path.exists(file)) and (os.path.exists(fwRepo)):
                        get_fw_code(file, fwRepo)
                    filePath = os.path.join(newLocation, file)
                    uri.text = filePath
                    break
    
    def add_path_variables(self, pathVariables : dict):
        varList = self.xml.find('variableList')
        for varName in pathVariables.keys():
            variable = None

            for currentVar in varList:
                if varName in currentVar.find('name').text:
                    variable = currentVar

            if variable is None:
                variable  = ET.SubElement(varList, 'variable')
                name      = ET.SubElement(variable, 'name')
                name.text = varName
                ET.SubElement(variable, 'value')

            variable.find('value').text = pathVariables[varName]

    
# ------- .cproject --------
class Atollic_C_Project (AtollicXml):
    def __init__ (self, projectFilePath : str):
        AtollicXml.__init__(self, projectFilePath)

# ------- MAIN --------
def main(argv : list):
    if (len(argv) < 2):
        print(argv[0] + USAGE)
        exit(-1)
    
    projectBase = argv[1]
    project = Atollic_Project(search_file(".project", projectBase))

    PATH_VAR['ROOT'] = atollic_variable(atollic_relpath(os.path.relpath(PATH_VAR['ROOT']), os.path.dirname(project.path)))
    project.relocate_linkedResources(resources   = RESOURCES,
                                     newLocation = 'ROOT',
                                     fwRepo      = DL_FW_PATH)
    project.add_path_variables(PATH_VAR)
    project.update_project_file()

    # cproject = Atollic_C_Project(search_file(".cproject", projectBase))

if __name__ == "__main__":
    main(sys.argv)