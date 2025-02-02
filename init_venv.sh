#!/usr/bin/env bash

eval "$(micromamba shell hook --shell=bash)"

micromamba create -n adaptive_cutsel -f requirements.txt -c conda-forge python=3.9 -y