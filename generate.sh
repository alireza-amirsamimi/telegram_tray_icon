#!/bin/bash
icon_file="telegram.svg"
gray_file="telegram_gray.svg"
red_file="telegram_red.svg"

# create a new folder
rm -rf ./new 2>/dev/null
mkdir  "new"

echo -e "In some versions of Telegram,pattern of tray icon file name is:\n\n\n   1:\"ico_22_\"\n\nand in the other versions is\n\n\n   2:\"icon_22_\"\n"
read -p "Which version are you using?" version

# create red icons 1-999
for number in {1..999};do

    # define new name for file
    if [ $version == 1 ];then
        new_name="ico_22_$number"
    else
        new_name="icon_22_$number"
    fi

# create a copy from original file
    cp "$red_file" new/"$new_name".svg

# replace No. 999 with $number in line 94  
    sed -i  "94s/999/$number/" new/"$new_name".svg

# convert svg to png
    inkscape -z -e new/"$new_name".png -w 22 -h 22 new/"$new_name".svg 2>/dev/null

# remove svg file
    rm new/"$new_name".svg
done

# create red icons _00 - _99
for counter in {1000..1099};do
    number=$(($counter - 1000))

    if [ $number -le 9 ];then
        number="0$number"
    fi

    number="_$number"
    number_string="_0"

    if [ $version == 1 ];then
        new_name="ico_22_$counter"
    else
        new_name="icon_22_$counter"
    fi



    cp "$red_file" new/"$new_name".svg

    sed -i  "94s/999/$number/" new/"$new_name".svg

    inkscape -z -e new/"$new_name".png -w 22 -h 22 new/"$new_name".svg 2>/dev/null

    rm new/"$new_name".svg

done

# create gray icons 1-999
for number in {1..999};do
    # define new name for file

    if [ $version == 1 ];then
        new_name="icomute_22_$number"
    else
        new_name="iconmute_22_$number"
    fi


# create a copy from original file
    cp "$gray_file" new/"$new_name".svg

# replace No. 999 with $number in line 94  
    sed -i  "94s/999/$number/" new/"$new_name".svg

# convert svg to png
    inkscape -z -e new/"$new_name".png -w 22 -h 22 new/"$new_name".svg 2>/dev/null

    rm new/"$new_name".svg

done

# create gray icons _00 - _99
for counter in {1000..1099};do
    number=$(($counter - 1000))

    if [ $number -le 9 ];then
        number="0$number"
    fi

    number="_$number"
    number_string="_0"

    if [ $version == 1 ];then
        new_name="icomute_22_$counter"
    else
        new_name="iconmute_22_$counter"
    fi


    cp "$gray_file" new/"$new_name".svg

    sed -i  "94s/999/$number/" new/"$new_name".svg

    inkscape -z -e new/"$new_name".png -w 22 -h 22 new/"$new_name".svg 2>/dev/null

    rm new/"$new_name".svg

done

if [ $version == 1 ];then
    default_name="icomute_22_0"
else
    default_name="iconmute_22_0"
fi


# create default icon 
inkscape -z -e  new/"icomute_22_0".png  -w 22 -h 22 "$icon_file" 2>/dev/null

