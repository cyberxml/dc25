bottom=800
top=1600
bigstep=100
smallstep=20
secs=60
radio=1
for lo in `seq ${bottom} ${bigstep} ${top}`; do
lo=900
hi=$((${lo}+100))
echo $lo $smallstep $hi
for flo in `seq ${lo} ${smallstep} ${hi}`; do

	fhi=$((${flo}+${smallstep}))
	echo $flo $smallstep $fhi
	/bin/rtl_power -d${radio} -f ${flo}M:${fhi}M:${smallstep}K -1 -p 0 > test.hi
	while read -r line; do
		python rtl_freq_locator.py $line
	done < test.hi > freqs.hi

	cat freqs.hi | cut -d' ' -f1 > freqs.hi.cut
	echo processing  ....
	wc -l freqs.hi.cut

	freqs=$(cat freqs.hi.cut | sed 's/^/-f /' | sed 's/$/ /' | tr -d '\n')
	echo $freqs 

	timeout ${secs}s rtl_fm -d ${radio} -s 22050 -l 1 ${freqs} - | multimon-ng -q -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -a FLEX -a EEA -a EIA -a CCIR -a MORSE_CW -f alpha /dev/stdin
done
done

exit 



















while read -r freq; do
	echo "#------------------------------"
	echo $freq
	echo "#------------------------------"
	#timeout 20s rtl_fm -A lut -s 22050  -f $freq - | multimon-ng -q -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -a FLEX -a EEA -a EIA -a CCIR -a MORSE_CW -f alpha /dev/stdin
	timeout 20s rtl_fm -s 22050  -f $freq - | multimon-ng -q -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -a FLEX -a EEA -a EIA -a CCIR -a MORSE_CW -f alpha /dev/stdin
	echo
done < freqs.hi.cut


