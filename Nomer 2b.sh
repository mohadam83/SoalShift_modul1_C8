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

#awk -F ',' -f 1_2b.awk WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3s
