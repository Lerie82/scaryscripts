#!/usr/bin/env bash
#Lerie Taylor 2023
#scarylerie@gmail.com
#get a bunch of device information

cmd_list=(
	#system
	"uname -a"
	whoami
	id
	#package manager
	"pm list users"
	"pm list features"
	"pm get-app-links"
	"pm list packages -3"
	#getprop
	"getprop persist.sys.timezone"
	"getprop persist.sys.perf.fingerprint"
	"getprop persist.vendor.radio.nitz_oper_lname"
	"getprop ro.base_build"
	"getprop ro.first_api_level"
	"getprop ro.platform"
	"getprop ro.platform.cpu.type"
	"getprop ro.boot.brand"
	"getprop ro.boot.bsn"
	"getprop ro.boot.code"
	"getprop ro.boot.cu"
	"getprop ro.boot.flash.locked"
	"getprop ro.boot.hardware"
	"getprop ro.boot.model"
	"getprop ro.boot.product"
	"getprop ro.boot.name"
	"getprop ro.boot.publicname"
	"getprop ro.boot.project_name"
	"getprop ro.bootloader"
	"getprop ro.build.base_version"
	"getprop ro.build.base_version"

)

for cmd in "${cmd_list[@]}"; do
	output=$(adb shell $cmd)
	echo "$output"
done
