#!/bin/bash

#test .sh script
Testfile="../test/test.text"

#touch $Testfile
#echo "hellow" >> $Testfile
#cat $Testfile
#echo "finished"
#echo $Testfile

#Testfile="hello"
#echo $Testfile " aaaa"
#echo "adding hostname as '"$Testfile"'"

echo "Adding new user '"${Testfile}"'"

echo "[archlinuxfr]
SigLevel=Never
Server=http://repo.archlinux.fr/$arch" >>  $Testfile
