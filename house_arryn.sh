#!/bin/bash
#======================================================================
#
#         USAGE: ./house_arryn.sh
#
#   DESCRIPTION:
#
#        AUTHOR: Mashael Al Abbad
#   ORGANIZATION: 
#       REVISION: ---
#======================================================================

#ser -o nounset                    # Treat unset variables as an error

outFile="20CenturyPresidents.txt"
help() 
{
	echo "Usage ./ house_arryn.sh -s sedsrc -a awksrc -i inputFile"
	exit 1
}

if [ "$1" == "--help" ] 
then
# Call help function
	help
fi

while getopts ":s:a:i:" opt
do
	case $opt in
		s) sedsrc=$OPTARG
			;;
		a) awksrc=$OPTARG
			;;
		i) iFile=$OPTARG
			;;
		\?) help
			;;
	esac
done

# Verify that sedsrc and swksrc and iFile are defined

# Call Sed script to modify data
sed -f $sedsrc $iFile | awk -f $awksrc > $outFile


exit 0
