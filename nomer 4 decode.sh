#!/bin/bash

convert() {
    printf "\\$(printf "%03o" "$1")"
}

hour=`echo $1 | cut -d':' -f 1`
log=`cat "$1$2"`

lwer=$(($hour + 65))

firstChar=`convert $lwer`
lastChar=`convert $(($lwer-1))`

if [ $lwer == 65 ]
then
    var=`printf '%s' "$log"`
else
    var=`printf '%s' "$log" | tr ${firstChar,,}-za-${lastChar,,}$firstChar-ZA-$lastChar a-zA-Z`
fi

printf '%s\n' "$var"
