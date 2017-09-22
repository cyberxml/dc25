nc -l -u 7355 | \
     sox -t raw -esigned-integer -b16 -r 48000 - -esigned-integer -b16 -r 22050 -t raw - | \
     multimon-ng -t raw -a SCOPE -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -a FLEX -a EAS -a MORSE_CW -f alpha -

#multimon-ng -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -a FLEX -a EAS -a UFSK1200 -a CLIPFSK -a FMSFSK -a AFSK1200 -a AFSK2400 -a AFSK2400_2 -a AFSK2400_3 -a HAPN4800 -a FSK9600 -a DTMF -a ZVEI1 -a ZVEI2 -a ZVEI3 -a DZVEI -a PZVEI -a EEA -a EIA -a CCIR  -a SCOPE -f alpha -

