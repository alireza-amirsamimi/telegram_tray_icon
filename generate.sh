#!/bin/bash
icon_file="telegram.svg"
gray_file="telegram_gray.svg"
red_file="telegram_red.svg"

#creating a new folder
rm -rf ./new 2>/dev/null
mkdir  "new"

#creating red icons 1-999
for number in {1..999};do
    #defining new name for file
    new_name="ico_22_$number"

#creating a copy from original file
    cp "$red_file" new/"$new_name".svg

#replacing No. 999 with $number in line 94  
    sed -i  "94s/999/$number/" new/"$new_name".svg

#converting svg to png
    inkscape -z -e new/"$new_name".png -w 22 -h 22 new/"$new_name".svg 2>/dev/null

#removing svg file
    rm new/"$new_name".svg
done

#creating red icons _00 - _99
for counter in {1000..1099};do
    number=$(($counter - 1000))
    if [ $number -le 9 ];then
        number="0$number"
    fi
    number="_$number"
    number_string="_0"
    new_name="ico_22_$counter"

    cp "$red_file" new/"$new_name".svg

    sed -i  "94s/999/$number/" new/"$new_name".svg

    inkscape -z -e new/"$new_name".png -w 22 -h 22 new/"$new_name".svg 2>/dev/null

    rm new/"$new_name".svg

done

#creating gray icons 1-999
for number in {1..999};do
    #defining new name for file
    new_name="icomute_22_$number"

#creating a copy from original file
    cp "$gray_file" new/"$new_name".svg

#replacing No. 999 with $number in line 94  
    sed -i  "94s/999/$number/" new/"$new_name".svg

#converting svg to png
    inkscape -z -e new/"$new_name".png -w 22 -h 22 new/"$new_name".svg 2>/dev/null

    rm new/"$new_name".svg

done

#creating gray icons _00 - _99
for counter in {1000..1099};do
    number=$(($counter - 1000))
    if [ $number -le 9 ];then
        number="0$number"
    fi
    number="_$number"
    number_string="_0"
    new_name="icomute_22_$counter"

    cp "$gray_file" new/"$new_name".svg

    sed -i  "94s/999/$number/" new/"$new_name".svg

    inkscape -z -e new/"$new_name".png -w 22 -h 22 new/"$new_name".svg 2>/dev/null

    rm new/"$new_name".svg

done

#creating default icon 
inkscape -z -e  new/"icomute_22_0".png  -w 22 -h 22 "$icon_file" 2>/dev/null

