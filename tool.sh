#!/bin/bash
axel=$(which axel 2>&1)
wget=$(which wget 2>&1)
curl=$(which curl 2>&1)
apt=$(which apt 2>&1)
pacman=$(which pacman 2>&1)

if [ -f "${axel}" ];
then
    echo axel: YES
    echo $axel
else
    echo "axel" >./tool.conf
fi

if [ -f "${wget}" ];
then
    echo wget: YES
    echo $wget
else
    echo "wget" >>./tool.conf
fi

if [ -f "${curl}" ];
then
    echo curl: YES
    echo $curl
else
    echo "curl" >>./tool.conf
fi

echo ""

if [ -f "./tool.conf" ];
then
    if [ -f "${pacman}" ];
    then
        sudo pacman -S $(cat ./tool.conf)
    else
        echo ""
    fi
    
    if [ -f "${apt}" ];
    then
        sudo apt install $(cat ./tool.conf)
    else
        echo ""
    fi
else
    echo ""
fi

rm ./tool.conf > /dev/null 2>&1
