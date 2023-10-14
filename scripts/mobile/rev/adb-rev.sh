#!/usr/bin/env bash
#Lerie Taylor 2023
#scarylerie@gmail.com
#reverse engineer an apk for data mining

#search for xml files
#ls -DAaRc |tee list|grep -iE "\.xml$"

#search for xml file names
#ls -DAaRc |tee list|grep -iE "\.xml$" |grep -i setting

######
apk_com_name="com.sketchware.remod"

echo "Assembling the path to the APK ($apk_com_name)"
#apk_path=$(adb shell pm path $apk_com_name|cut -d":" -f2)

echo "Pulling the APK ($apk_path)"
#adb pull $apk_path

echo "Decompiling APK (base.apk)"
#sudo apktool d base.apk
####

#start mining
echo "Mining.."
xml_files=$(ls -aAR base/res/ |tee files_|grep -E "\.xml$" >files_xml)
xml_files=$(ls -aAR base/res/ |tee files_|grep -E "\.apk$" >files_apk)

file_count_xml=$(cat files_xml|wc -l)
file_count_apk=$(cat files_apk|wc -l)
file_count_img=$(ls -aAR base/res/ |tee files_xml|grep -E "\.(png|jpg|bmp|tiff|jpeg|gif)$"|wc -l)

echo "XML Files: $file_count_xml"
echo "APK Files: $file_count_apk"
echo "Image Files: $file_count_img"
