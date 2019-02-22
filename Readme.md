# Soal No. 1

/#!/bin/bash

/#xdg-open "nature&
unzip /home/adam/SoalShift_modul1_C8/nature.zip -d /home/adam/Downloads --> syntax ini berfungsi untuk mengekstrak file yang bertipe zip

a=1
for x in /home/adam/SoalShift_modul1_C8/nature/*.jpg
do
`base64 -d $x > /home/adam/SoalShift_modul1_C8/nature/$a.jpg`
`xxd -r /home/adam/SoalShift_modul1_C8/nature/$a.jpg > /home/adam/SoalShift_modul1_C8/picture$a.jpg`
a=`expr $a + 1`
done

syntax di atas adalah proses perulangan, yang mana syntax di atas akan mengecek semua file bertipe .jpg kemudian karena file tersebut tidak bisa dibuka karena di enkripsi maka harus dilakukan proses dengan menggunakan syntax base64, tetapi hal itu belum cukup karena file masih belum bisa terbuka karena konfigurasi file tersebut ketika di cek melalui hexdump masih ada yang salah sehingga perlu dilakukan proses invers sehingga pada akhirnya file tersebut bisa terbuka.

# Soal No. 2
## 2a
BEGIN{
   arr[0]=0;
   jumlah[0]=0;
   i=0;
}

{
   temp=($1);
   tanda=0;
   if(($7) == "2012" && ($10)!= "Quantity"){
	   for(j=1; j<=i; j++){
	      if(arr[j]==temp){
		 jumlah[j]=jumlah[j]+($10);
		 j=i+1;
		 tanda=1;
	      }
	   }
	   if(tanda==0){
	      arr[i+1]=temp;
	      jumlah[i+1]=($10);
	      i++;
	   }
   }
}

END{
   max=0;
   negara=0;
   for(k=1; k<=i; k++){
      if(jumlah[k]>max){
	 max = jumlah[k];
	 negara = arr[k];
      }
   }
   print negara;
}

   Pada soal no.2 a ini, kami menggunakan 2 array dengan jumlah indeks sama, array pertama untuk menyimpan nama negara yang berbeda kemudian array kedua untuk menyimpan total hasil penjualan (berada di kolom ke 10 atau $10) dari negara yang berada pada indeks yang sama di array pertama dan juga perlu dilakukan pengecekan bahwa penjualan tersebut harus pada tahun 2012 yang mana data mengenai ini berada di kolom ke 7($7), sementara untuk nama negara ada di kolom 1 atau pada syntax di atas ditulis $1. Setelah itu pada bagian end akan dilakukan pengecekan jumlah penjualan masing2 negara melalui array kedua dan kemudian indeks yang menyimpan data penjualan terbanyak tersebut akan mencetak nama negara di array pertama dengan indeks yang sama.

awk -F ',' -f 1_2a.awk WA_Sales_Products_2012-14.csv --> syntax ini di jalankan di terminal. -F ',' tanda koma yang diapit 2 tanda petik tunggal ini dan juga _F tersebut agar tanda koma yang memisahkan setiap kolom pada file bertipe .csv bisa terbaca sebagai space. 

## 2b

BEGIN{
   arr[0]=0;
   jumlah[0]=0;
   i=0;
}

{
   temp=($4);
   tanda=0;
   if(($1) == "United States" && ($7) == "2012" && ($10)!= "Quantity"){
	   for(j=1; j<=i; j++){
	      if(arr[j]==temp){
		 jumlah[j]=jumlah[j]+($10);
		 j=i+1;
		 tanda=1;
	      }
	   }
	   if(tanda==0){
	      arr[i+1]=temp;
	      jumlah[i+1]=($10);
	      i++;
	   }
   }
}

END{
   for(k=1; k<=i; k++){
      print jumlah[k] " " arr[k];
   }
}

   Penjelasannya sama seperti pada bagian a, perbedaannya hanya pada array pertama yang mana di bagian a menyimpan nama negara, sementara untuk bagian b ini digunakan untuk menyimpan nama-nama product line (berada pada kolom ke 4 atau $4) yang berbeda yang terdapat pada negara United States (hasil dari proses pada bagian a). Sehingga untuk menyimpan nama-nama product line harus dilakukan pengecekan pada kolom ke 4 atau $4 dan ada penambahan pembanding di bagian if yaitu nama negara harus sama dengan United States. Kemudian, di bagian END dilakukan proses pencetakan kedua array tersebut yang bersebelahan antara array pertama dan kedua yang memiliki indeks yang sama.

awk -F ',' -f 1_2b.awk WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3s --> syntax ini dijalankan di terminal untuk melakukan proses pengurutan secara ascending berdasarkan kolom yang berisi number (sort -n) dan kemudian di reverse agar menjadi descending (-r) dan kemudian (head -n 3s) syntax di samping berfungsi agar hanya tercetak 3 data yang berada di baris teratas.

## 2c
BEGIN{
   arr[0]=0;
   jumlah[0]=0;
   i=0;
}

{
   temp=($6);
   tanda=0;
   if(($1) == "United States" && ($7) == "2012" && (($4) == "Personal Accessories" || ($4)=="Camping Equipment" || ($4)=="Outdoor Protection")){
	   for(j=1; j<=i; j++){
	      if(arr[j]==temp){
		 jumlah[j]=jumlah[j]+($10);
		 j=i+1;
		 tanda=1;
	      }
	   }
	   if(tanda==0){
	      arr[i+1]=temp;
	      jumlah[i+1]=($10);
	      i++;
	   }
   }
}

END{
   for(k=1; k<=i; k++){
      print jumlah[k] " " arr[k];
   }
}

   Untuk bagian c ini tidak berbeda jauh dengan bagian b, hanya saja berbeda di bagian if dengan menambahkan syarat baru yaitu berupa product line yang muncul di bagian b dan juga array pertama yang awalnya untuk menyimpan product line diubah menjadi menyimpan data di kolom product yaitu di kolom 6 ($6).

awk -F ',' -f 1_2b.awk WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3s --> penjelasan syntax ini sama seperti pada bagian b sebelumnya.

# Soal No. 3
Script :

pswd=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

check=0
number=1
while test -e "password$number.txt" ;
do ((++check))
number="$check"
done

echo "$pswd" >> "password$number.txt"

cara :

    1. Buat script dengan extention .sh 
    2. Buatlah script untuk membuat password secara acak dengan maksimal 12 karakter 
    • tr -dc 'a-zA-Z0-9' : untuk menghasilkan huruf besar, huruf kecil, dan angka secara acak.
    • fold -w 12 : membuat hasil output dalam 1 kolom hanya 12 karakter
    • head -n 1 : hanya menampilkan hasil output 1 baris pertama
    3. Variabel ‘check’ adalah variabel untuk increment nilai dari variabel ‘number’ dan penanda untuk mengecek apakah file password[number] tersebut sudah ada atau belum, jika ada maka nomor file akan melanjutkan nomor yang sudah ada, jika belum maka akan mengisi nomor file yang belum dipakai. 
    4. Variabel  ‘number’ digunakan untuk memberi nomor pada file (password[number].txt).
    5. Setelah membuat script, jalankan script menggunakan bash.



# Soal No. 4
#!/bin/bash

convert() {
    printf "\\$(printf "%03o" "$1")" --> untuk mengonversi bilangan ke character
}

hour=`date +%H` --> berfungsi untuk mengakses jam terkini
fname=`date +"%H:%M %d-%m-%Y"` --> berfungsi untuk menyimpan informasi mengenai waktu dan tanggal sebagai nama file nantinya
log=`cat /var/log/syslog` --> untuk menyimpan file yang ditampilkan oleh syntax cat

lwer=$(($hour + 65)) --> untuk mengubah huruf lama menjadi huruf baru setelah ditambah dengan jam terkini

firstChar=`convert $lwer` --> sebagai batas awal sampai z 
lastChar=`convert $(($lwer-1))` --> sebagai batas akhir dari a

karena disini kami menggunakan 2 rentang seperti yang tampak pada variabel var di bawah

if [ $lwer == 65 ]
then
    var=`printf '%s' "$log"` --> proses mencetak isi dari variabel log tanpa perlu melakukan perubahan karena nilai variabel hour = 0
else
    var=`printf '%s' "$log" | tr a-zA-Z ${firstChar,,}-za-${lastChar,,}$firstChar-ZA-$lastChar` 

--> syntax baris di atas untuk menyimpan character yang akan dicetak setelah konversi huruf awal menjadi huruf baru setelah ditambah dengan nilai jam. karena menggunakan nilai 65 yang merupakan nilai dari ascii A, maka untuk mengubah huruf lowercase cukup dengan menggunakan tanda ,, (koma double) setelah variabel firstChar atau lastChar, seperti pada syntax di atas

fi

printf '%s\n' "$var" > "$fname".txt --> mencetak isi variabel var dan disimpan ke file dengan nama yang sesuai pada variabel fname

Syntax di atas untuk proses encode

#!/bin/bash

convert() {
    printf "\\$(printf "%03o" "$1")"
}

hour=`echo $1 | cut -d':' -f 1`
log=`cat "$1$2"`

2 baris syntax di atas untuk mengakses nama file yang akan kita decode lagi

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

perbedaan antara encode dan decode hanya terletak pada syntax else yaitu menukar posisi yang mana di bagian setelah tr (translate) jika di bagian encode di awali dengan rentang yang pasti yaitu a-zA-Z baru hasil perubahannya, sementara pada bagian decode a-zA-Z berada di bagian belakang.

# Soal No. 5
Script :

awk '(/cron/ || /CRON/) && (!/sudo/) && (NF < 13) {print}' /var/log/syslog >> /home/salsha/sisop/no5.log

cara :

    1. Buat script dengan extention .sh
    2. Buatlah script yang akan menjalankan command awk yang dimana script tersebut mengizinkan string ‘cron’ yang tidak case sensitive '(/cron/ || /CRON/) , tidak mengandung string sudo (!/sudo/) dan jumlah field yang tidak lebih dari 13 (NF < 13).
    3. Setelah itu simpanlah file syslog tersebut kedalam folder yang diinginkan. Contoh : perintah >> /home/salsha/sisop/no5.log
    4. Buat cron job dengan perintah crontab -e dan aturlah waktunya seperti berikut : s2-30/6 * * * * /bin/bash /home/salsha/sisop/no5.sh



