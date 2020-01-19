#!/bin/bash
if [ "$1" ]
then
        view=`find /cygdrive/x/ -maxdepth 1 -name "*$1*"|cut -d / -f 4`
        cmd /c b.bat $view
else
        echo $view" not exists"
fi
#cmd /c cd /d x:/${view}/
