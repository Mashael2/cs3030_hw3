#!/bin/awk

BEGIN{FS=","} # comma delimiter


{
	year=substr($5,length($5) - 3)
	#print year
	if (year > 1899)
		print $2 " from " $4 " to " $5
}
