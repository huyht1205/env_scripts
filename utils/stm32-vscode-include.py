#!/usr/bin/env python3

import os, re, sys, json, requests
C_CPP_JSON='.vscode/c_cpp_properties.json'
ENV_JSON='/data/git_repo/env_scripts/template/vscode/stm32-env-template.json'
STD_C='c99'

def main(argv):
    global C_CPP_JSON
    if len(argv) >= 2:
        C_CPP_JSON = os.path.join(argv[1], C_CPP_JSON) 

    with open(C_CPP_JSON, 'r') as f:
        vscodeJson = json.load(f)
        f.close()
    
    with open(ENV_JSON, 'r') as f:
        envTemplate = json.load(f)
        f.close()
    
    vscodeJson['env'] = envTemplate['env']
    vscodeConfiguration = vscodeJson['configurations'][0]
    vscodeConfiguration['compilerPath'] = '${CC}'
    vscodeConfiguration['cStandard'] = STD_C

    appendConfig = {'includePath': '${uInclude}', 'defines': '${uDefines}'}
    for key in appendConfig.keys():
        tmp = vscodeConfiguration[key]
        if not appendConfig[key] in tmp:
            tmp.append(appendConfig[key])

    with open(C_CPP_JSON, 'w') as out:
        json.dump(vscodeJson, out, sort_keys=True, indent=4)
        out.close()

if __name__ == "__main__":
    main(sys.argv)
