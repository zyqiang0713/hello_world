#!/bin/bash

# exec command ls -l after find results
find . -exec ls -l { }  \;
#sed command, can change files directly, s--replace string 
sed -i '2,3s/t/a/g' a.txt
#sed insert string after current line 
sed -i '$a this is a insert line ' a.txt
