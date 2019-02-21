#!/bin/bash

#xdg-open "nature&
unzip /home/adam/Downloads/nature.zip -d /home/adam/Downloads

a=1
for x in /home/adam/Downloads/nature/*.jpg
do
`base64 -d $x > /home/adam/Downloads/nature/$a.jpg`
`xxd -r /home/adam/Downloads/nature/$a.jpg > /home/adam/Downloads/picture$a.jpg`
a=`expr $a + 1`
done
