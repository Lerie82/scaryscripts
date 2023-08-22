#!/bin/bash
# Lerie Taylor 2023
###############
# gui (dialog) selection for scaryscripts

#[] get a list of scripts from scripts/ directory (recursivly) *.sh
script_list=($(ls -R scripts/*/*.sh))

#for scr in ${script_list[@]}; do
	#do something with each one
#done
dialog --ascii-lines \
	--menu \
	"Select a script.." \
	20 70 10 \
	"wp-json scanner" "WordPress wp-json scanner"

#[] show user a list of the scripts to choose from

#[] user selects a script from the list
#[] user selected script is executed
