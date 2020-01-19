pwd
grep -o 'SourceFile\((.*)\)' $1| cut -d\' -f 2 > FileList.txt
grep -o 'HeaderFile\((.*)\)' $1| cut -d\' -f 2 >> FileList.txt
grep -o 'T55File\((.*\.t55.*)\)' $1| cut -d\' -f 2 >> FileList.txt
grep -o 'ProjectFile\('.*'\)' $1| cut -d\' -f 2 >> FileList.txt
