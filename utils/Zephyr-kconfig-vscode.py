#!/usr/bin/python3

import json, argparse
C_CPP_JSON='.vscode/c_cpp_properties.json'
USER_DEFINE='user-defines'
KCONFIG='_build/zephyr/.config'

def add_to_c_cpp_properties(vscodeJson : dict, configFieldName : str, inField, name : str):
    if 'env' not in vscodeJson:
        env = dict()
        env[name] = inField
        vscodeJson['env'] = env
    else:
        if USER_DEFINE not in vscodeJson['env']:
            vscodeJson['env'][name] = inField
        else:
            vscodeJson['env'][name] += inField

    configField = vscodeJson['configurations'][0][configFieldName]
    if not configField.count('${' + name + '}'):
        configField.append('${' + name + '}')

def translate_kconfig_to_vscode_defines(kconfigName: str) -> list:
    out = list()
    with open(kconfigName, 'r') as f:
        for line in f:
            if line[0] != '#' and line[0] != '\n':
                config,value = line.strip().replace('\"', '').split('=')
                if value == 'y':
                    out.append(config)
                else:
                    out.append(config + '=' + value)

        f.close()
    
    return out

def main():
    argParser = argparse.ArgumentParser(description='Insert kconfig defines into vscode config')
    argParser.add_argument('-k', action='store', metavar='<path>', nargs=1, default=KCONFIG,
        type=str, help='path to .config. Default = ' + KCONFIG, dest='kconfig')
    argParser.add_argument('-c', action='store', metavar='<path>', nargs=1, default=C_CPP_JSON,
        type=str, help='path to c_cpp_properties.json. Default = ' + C_CPP_JSON, dest='vscodeJson')

    args = argParser.parse_args()

    with open(args.vscodeJson, 'r') as f:
        vscodeJson  = json.load(f)
        f.close()
    
    userDefines = translate_kconfig_to_vscode_defines(args.kconfig)
    add_to_c_cpp_properties(vscodeJson, 'defines', userDefines, USER_DEFINE)

    with open(args.vscodeJson, 'w') as f:
        json.dump(vscodeJson, f, sort_keys=True, indent=4)
        f.close()

if __name__ == '__main__':
    main()
