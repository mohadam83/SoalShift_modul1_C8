#!/bin/bash

convert() {
    printf "\\$(printf "%03o" "$1")"
}

hour=`date +%H`
fname=`date +"%H:%M %d-%m-%Y"`
log=`cat /var/log/syslog`

lwer=$(($hour + 65))

firstChar=`convert $lwer`
lastChar=`convert $(($lwer-1))`

if [ $lwer == 65 ]
then
    var=`printf '%s' "$log"`
else
    var=`printf '%s' "$log" | tr a-zA-Z ${firstChar,,}-za-${lastChar,,}$firstChar-ZA-$lastChar`
fi

printf '%s\n' "$var" > "$fname".txt
