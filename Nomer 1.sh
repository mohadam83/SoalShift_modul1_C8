#!/bin/bash

#xdg-open "nature&
unzip /home/adam/SoalShift_modul1_C8/nature.zip -d /home/adam/SoalShift_modul1_C8

a=1
for x in /home/adam/SoalShift_modul1_C8/nature/*.jpg
do
`base64 -d $x > /home/adam/SoalShift_modul1_C8/nature/$a.jpg`
`xxd -r /home/adam/SoalShift_modul1_C8/nature/$a.jpg > /home/adam/SoalShift_modul1_C8/picture$a.jpg`
a=`expr $a + 1`
done
