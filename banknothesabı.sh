#!/bin/bash
echo "Lütfen çekmek istediğiniz tutarı girin."
read tutar
 
let "kalan= $tutar%10"
 
while [ $kalan -ne 0 ]
	do 
		echo "Lütfen 10'un katlarında tutar giriniz."
		read tutar
		let "kalan= $tutar%10"
done

echo "Tutar kabul edildi."

if [ $tutar -ge 100 ]
	then
	let "i= $tutar/100"
	let "tutar= $tutar%100"
	
	else 
	let "i= 0"
fi

if [ $tutar -ge 50 ]
	then
	let "j= $tutar/50"
	let "tutar= $tutar%50"
	
	else 
	let "j= 0"
fi

if [ $tutar -ge 20 ]
	then
	let "k= $tutar/20"
	let "tutar= $tutar%20"
	
	else 
	let "k= 0"
fi

if [ $tutar -ge 10 ]
	then
	let "l= $tutar/10"
	let "tutar= $tutar%10"
	
	else 
	let "l= 0"
fi

echo "İŞLEM BAŞARILI"
echo "Alacağınız banknotlar"
echo "$i adet 100TL
$j adet 50TL
$k adet 20TL
$l adet 10TL"


