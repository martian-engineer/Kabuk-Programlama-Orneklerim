#!/bin/bash

#ARZU KAYA
#dijital saat bilgilerinde açı hesaplaması hatalı olmaktaydı. Hesaplamayı mükemmelleştirmek için 12'den sonraki dijital değerlerde 360 derecelik fark aldım.
#ayrıca mutlak değer için hangi işareti kullanmamız gerektiğini bulamadığımdan sıfırdan küçük ve büyük olma durumunu araştırdım.
#elimden geldiğince kusursuzlaştırmaya çalıştım. Halen hata varsa affola.

echo "Hesaplama yapmak için 3 tuşlayın"
read cvp

saat=$(date +'%H')
dak=$(date +'%M')

while [ $cvp -eq 3 ]
	do
	echo "Saat ve dakika bilgisini girmek için 1, sistemden alınması için 2 tuşlayın"
	read cevap
	if [ $cevap -eq 1 ]
	then
		echo "Yalnızca Saat bilgisi girin"
		read saat1
		echo "Yalnızca Dakika bilgisini girin"
		read dak2
		echo saat-- $saat1:$dak2	
		let "aci= (11*($dak2)-60*$saat1)/2"
		if [ $saat1 -ge 12 -a $saat1 -le 23 ]
			then	
			if [ $aci -lt 0 ]
				then
				let "yeniaci=($aci*(-1))"
				 if [ $yeniaci -ge 360 ]	
					then
					let "yyeniaci=$yeniaci-360"
					echo "akrep ve yelkovan arasındaki açı= " $yyeniaci
					else
					let "yyeniaci= 360-$yeniaci"
					echo "akrep ve yelkovan arasındaki açı= " $yyeniaci
				 fi
				
				else
				let "yaci= 360-$aci"
				echo "akrep ve yelkovan arasındaki açı= " $yaci
			fi	
			else
			if [ $aci -lt 0 ]
				then
				let "yeniaci=aci*(-1)"	
				echo "akrep ve yelkovan arasındaki açı= " $yeniaci
				else
				echo "akrep ve yelkovan arasındaki açı= " $aci
				
			fi

		fi		
	
	elif [ $cevap -eq 2 ]
		then
		echo "Sistemden saat bilgisi alınmakta.."
		sleep 5
		echo saat: $saat:$dak
		let "aci= (11*($dak)-60*$saat)/2"
		if [ $saat -ge 12 -a $saat -le 23 ]
			then	
			if [ $aci -lt 0 ]
				then
				let "yeniaci=($aci*(-1))"
				 if [ $yeniaci -ge 360 ]	
					then
					let "yyeniaci=$yeniaci-360"
					echo "akrep ve yelkovan arasındaki açı= " $yyeniaci
					else
					let "yyeniaci= 360-$yeniaci"
					echo "akrep ve yelkovan arasındaki açı= " $yyeniaci
				 fi
				
				else
				let "yaci= 360-$aci"
				echo "akrep ve yelkovan arasındaki açı= " $yaci
			fi	
			else
			if [ $aci -lt 0 ]
				then
				let "yeniaci=aci*(-1)"	
				echo "akrep ve yelkovan arasındaki açı= " $yeniaci
				else
				echo "akrep ve yelkovan arasındaki açı= " $aci
				
			fi

		fi		
	
	else
	echo "Geçersiz işlem."
		
	fi
	
	echo "Tekrar hesaplama yapmak için 3 tuşlayın"
read cvp
done
echo "bitti"
