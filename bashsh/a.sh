exist_file()
{
    if [ -e "$1" ]
    then
        return 1
    else
        return 2
    fi
}

exist_file *.hex
value=$?

if [ $value -eq 1 ]
then
        echo "exist"
elif [ $value -eq 2 ]
then
  mv /mnt/update/*.ko /mnt
fi
