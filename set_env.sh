#! /usr/bin/env bash

module load lang/Python/3.8.6-GCCcore-10.2.0
# /usr/bin/python3 venv
#source venv/bin/activate
micromamba activate venv3

# Add the python path
export PYTHONPATH=$(pwd):$PYTHONPATH
