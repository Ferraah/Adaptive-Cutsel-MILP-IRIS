#! /usr/bin/env bash

#virtualenv -p python3.8 venv
micromamba create --name venv
# /usr/bin/python3 venv
#source venv/bin/activate
micromamba activate venv

# install everything
pip install -r requirements.txt
pip install -r requirements2.txt

deactivate
