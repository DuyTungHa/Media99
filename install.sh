#!/bin/sh
sudo apt update
sudo apt-get -y install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
sudo apt update
sudo apt-get -y install libmysqlclient-dev
pip3 install wheel
sudo apt-get install python3.6
sudo apt -y install python3-venv
python3 -m venv myprojectenv
source myprojectenv/bin/activate
pip install -r requirements/dev.txt
export FLASK_APP=flasky.py
export FLASK_DEBUG=1
