radio=0
freqs='-f 123.456M -f 234.567M -f 321.0M -f 345.678M -f 432.10M -f 456.678M -f 543.21M -f 567.890M -f 654.321M -f 678.9M -f 765.432M -f 876.543M -f 987.654M -f 1234.567M'
rtl_fm -d ${radio} -s 22050 -l 1 ${freqs} - | multimon-ng -q -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -a FLEX -a EEA -a EIA -a CCIR -a MORSE_CW -f alpha /dev/stdin
