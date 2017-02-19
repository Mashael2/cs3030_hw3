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
	echo "Usage ./house_arryn.sh -s sedsrc -a awksrc -i inputFile"
	exit 1
}

reqHelp()
{
	echo "Missing arguments"
	echo "Usage ./house_arryn.sh -s sedsrc -a awksrc -i inputFile"
	exit 1
}

message()
{
	echo "Your output file will be save in the 20CenturyPresidents.txt"
	exit 1
}

if [[ "$1" == "--help" ]] 
then
# Call help function
	help
fi

# Verify that sedsrc and awksrc and iFile are defined
if [[ "$1" != "-s" ]] || [[ "$3" != "-a" ]] || [[ "$5" != "-i" ]]
then
	reqHelp
fi

#if [[ "$1" == "-s" ]] || [[ "$3" == "-a" ]] || [[ "$5" != "-i" ]]
#then
#	reqHelp
#fi

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

# Call Sed script to modify data
sed -f $sedsrc $iFile | awk -f $awksrc > $outFile

exit 0
