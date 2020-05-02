#!/usr/bin/env python3
"""
Example! modify for your package!

This is the setup.py for company.group.pypackagedir

Perform tasks

Includes a package, an application and some data files

https://packaging.python.org/tutorials/packaging-projects/#initial-files
"""
from glob import glob
from os import walk
from os.path import (
    abspath,
    dirname,
    join as join_path)
from setuptools import setup
import versioneer


def enumerate_static_content(basedir_list):
    """Recursively enumerate data files"""
    file_list = []
    for basedir in basedir_list:
        for path, _, files in walk(basedir):
            file_list.append((path, [join_path(
                path, file) for file in files if file not in EXCLUDE_FILES]))
    return file_list


CURDIR = abspath(dirname(__file__))

PACKAGE = 'instaserv'
PROJECT_NAME = 'py{}'.format(PACKAGE)

USERNAME = 'mzpqnxow'
NAMESPACE = [USERNAME]
NAME = '.'.join(NAMESPACE + [PROJECT_NAME])

EXCLUDE_FILES = (
    'constraints.txt',
    'interactive',
    'pip.ini',
    'pip.ini.socks')
LICENSE = 'BSD 3-Clause'
PACKAGE_DATA_DIRS = ['serv/']
PYTHON_REQUIRES = '>=3'

SCRIPTS = glob('bin/*')

DATA_FILE_LIST = enumerate_static_content(PACKAGE_DATA_DIRS)

setup(
    cmdclass=versioneer.get_cmdclass(),
    version=versioneer.get_version(),
    data_files=DATA_FILE_LIST,
    name=NAME,
    scripts=SCRIPTS)
