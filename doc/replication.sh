#!/bin/bash
IP='192.168.0.100'
NA='rsb'

if [ "$1" = "reset" ]
then
        pkill -9 mongo
        rm -rf /home/m*
        exit
fi


if [ "$1" = "install" ]
then

    mkdir -p /home/m0 /home/m1 /home/m2 /home/mlog

    /usr/local/mongodb/bin/mongod --dbpath /home/m0 --logpath /home/mlog/m17.log --logappend --port 27017 --smallfiles --fork 
--replSet ${NA}
    /usr/local/mongodb/bin/mongod --dbpath /home/m1 --logpath /home/mlog/m18.log --logappend --port 27018 --smallfiles --fork 
--replSet ${NA}
    /usr/local/mongodb/bin/mongod --dbpath /home/m2 --logpath /home/mlog/m19.log --logappend --port 27019 --smallfiles --fork 
--replSet ${NA}
   
    exit
fi


if [ "$1" = "repl" ]
then
/usr/local/mongodb/bin/mongo <<EOF

use admin
rsconf = {
_id:'${NA}',
members:[
{_id:0,host:'${IP}:27017'},
{_id:1,host:'${IP}:27018'},
{_id:2,host:'${IP}:27019'},
]
}
rs.initiate(rsconf)
EOF
fi