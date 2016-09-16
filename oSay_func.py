#!/usr/bin/python
# Dev par Cdiez50
# Fait en python3

# -*- coding: utf-8 -*-

# Liste des Import à prévoir pour le bon fonctionnement applicatif
import os, sys
import subprocess

# Définition de la function de lecture
def oSay_func(arg):
    subprocess.call(['google_speech', '-l', 'en', arg, '-e', 'speed', '1.1'])

# Execution de la fonction de lecture
oSay_func("Hello World !")

