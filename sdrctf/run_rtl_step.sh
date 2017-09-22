offset=12
for kfreq in `seq 810000 100 830000`; do
	echo "#------------------------------"
	echo $((${kfreq}+20*$offset))
	echo "#------------------------------"
	timeout 20s rtl_fm -d 0 -l 1 -s ${offset}K  -f ${kfreq}K - | multimon-ng -q -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -a FLEX -a EEA -a EIA -a CCIR -a MORSE_CW -f alpha /dev/stdin
	echo
done 


