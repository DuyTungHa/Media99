#!/bin/bash
sudo yum update
sudo yum -y install python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
sudo yum update
sudo yum -y install libmysqlclient-dev
pip3 install wheel
sudo yum -y install python3-venv
python3 -m venv myprojectenv
source myprojectenv/bin/activate
export FLASK_DEBUG=1
export FLASK_APP=flasky.py
pip install -r requirements/dev.txt
