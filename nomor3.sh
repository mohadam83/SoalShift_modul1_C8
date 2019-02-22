check=0
number=1
while test -e "password$number.txt" ;
do ((++check))
number="$check"
done

pswd=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
echo "$pswd" >> "password$number.txt"

