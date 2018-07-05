#!/usr/bin/env python3

import os
import shutil
import json
import yaml


SRC = 'src'
DIST = 'dist'

def get_versioned_name(package, version):
    return package + '@' + version

with open(os.path.join(os.pardir, 'src', 'builder.yml')) as builder_yaml:
    builder = yaml.load(builder_yaml)
    BUILDER_NAME = builder['name']
    BUILDER_VERSION = builder['version']

NODE_MODULES = 'node_modules'

def get_npm_version(package):
    with open(os.path.join(NODE_MODULES, package, 'package.json')) as package_json_file:
        package_json = json.load(package_json_file)
    return package_json['version']

def copy_npm_subtree(package, subtree):
    try:
        print('Copying {package} package {subtree} subtree'.format(package=package, subtree=subtree))
        shutil.copytree(os.path.join(NODE_MODULES, package, subtree), 
                        os.path.join(DIST, 
                            get_versioned_name(package, get_npm_version(package)), subtree))
    except FileExistsError:
        print('Skipped')

try:
    print('Copying builder')
    shutil.copytree(SRC, os.path.join(DIST, get_versioned_name(BUILDER_NAME, BUILDER_VERSION)))
except FileExistsError:
    print('Skipped')

print('Running npm install')
os.system('npm i')
copy_npm_subtree('purecss', 'build')
