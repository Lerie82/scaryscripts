#!/usr/bin/env bash
#666
#install the .666 environment
dir6="~/.666/scaryscripts"

# function permcheck()
# {
# 	sudo chown -R $USER ~/.666
# }
# permcheck

#check for the necessary directories
function dircheck()
{
	echo "[6] starting directory check"
	dirs=(
		"~/.666"
	)

	for d in ${dirs[@]}
	do
		if [ ! -d "$d" ]
		then
			echo "[d] creating directory $d"
			mkdir $d &>/dev/null
		fi
	done

	echo "[x] directory check complete"
}

#check for the 666 path
function pathcheck()
{
	echo "path check complete"
}

#link the bins
function binlink()
{
	scriptdirs=(
		local
		mobile
		rev
		porn
		scanners
		utils
		wifi
	)

	for sd in ${scriptdirs[@]}
	do
		file=$(ls $dir6/scripts/$sd/*.sh)
		echo $files
	done
}

binlink