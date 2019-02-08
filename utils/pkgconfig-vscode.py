#!/usr/bin/python3

import os, re, sys, json, requests
C_CPP_JSON=".vscode/c_cpp_properties.json"

def main(argv):
    pkgs     = ""
    for each in argv[1:]:
        pkgs = pkgs + " " + each
    cflags   = os.popen('pkg-config --cflags ' + pkgs).read().split()
    regex    = re.compile("-I.")
    includes = list()
    env      = dict()

    for each in cflags:
        if re.match(regex, each):
            includes.append(each[2:])
    
    env['user-include'] = includes
    
    with open(C_CPP_JSON, 'r') as f:
        vscode_json = json.load(f)
    f.close()
    
    vscode_json['env'] = env
    includePath        = vscode_json['configurations'][0]['includePath']
    if not includePath.count("${user-include}"):
        includePath.append("${user-include}")
    
    with open(C_CPP_JSON, 'w') as out:
        json.dump(vscode_json, out, sort_keys=True, indent=4)

if __name__ == "__main__":
    main(sys.argv)
