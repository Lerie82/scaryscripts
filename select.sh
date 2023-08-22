#!/bin/bash
# Lerie Taylor 2023
###############
# gui (dialog) selection for scaryscripts

#[] get a list of scripts from scripts/ directory (recursivly) *.sh
script_list=($(ls -R scripts/*/*.sh))

#[] show user a list of the scripts to choose from

#[] user selects a script from the list
#[] user selected script is executed
