#!bin/bash
echo "Enter Service Name"
read sn
echo "Enter Operation - Start/Stop/Restart"
read opn
echo "\nService is $sn\nOperation is $opn\n"

service $sn status > newfile1.txt

var2=`cat newfile1.txt | grep start | wc -l`

if [ $var2 -eq 1 ] && [ "$opn" = "start" ]
then echo "\n$sn is Already Running!\n"
elif [ $var2 -eq 1 ] && [ "$opn" = "stop" ]
then service $sn $opn
echo "Service $sn Stopped\n"
elif [ $var2 -eq 0 ] && [ "$opn" = "start" ]
then service $sn $opn
echo "Service $sn Started\n"
elif [ $var2 -eq 0 ] && [ "$opn" = "stop" ]
then echo "Service $sn is Already Stopped\n"
elif [ $var2 -ge 0 ] && [ "$opn" = "restart" ]
then service $sn $opn
echo "Service $sn Restarted\n"
else
echo "Invalid Option"
fi
