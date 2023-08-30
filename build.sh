#!/usr/bin/env bash

set -ex

#python -m pip install -r app/requirements.txt

#git clone https://github.com/cssnr/vultr-python.git

python -m pdoc -o build vultr-python/vultr.py
