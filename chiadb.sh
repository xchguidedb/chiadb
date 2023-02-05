#!/bin/bash

echo "Starting to create db backup: "`date +"%m-%d-%Y %H:%M"`
echo "Starting to create db backup: "`date +"%m-%d-%Y %H:%M"` >> /home/amaury/temp/Logs/Info.log

rm -f /home/amaury/temp/DBCopy/blockchain_v2_mainnet.sqlite
sqlite3 /home/amaury/.chia/mainnet/db/blockchain_v2_mainnet.sqlite "vacuum into '/home/amaury/temp/DBCopy/blockchain_v2_mainnet.sqlite'"

echo "Finished to create db backup. Started to compress db: "`date +"%m-%d-%Y %H:%M"`
echo "Finished to create db backup. Started to compress db: "`date +"%m-%d-%Y %H:%M"` >> /home/amaury/temp/Logs/Info.log

rm -f /home/amaury/temp/DBRar/blockchain_v2_mainnet.sqlite_in_progress.rar
cd /home/amaury/temp/DBCopy
rar a /home/amaury/temp/DBRar/blockchain_v2_mainnet.sqlite_in_progress.rar .

echo "Finished to compress db. Starting to move to webserver: "`date +"%m-%d-%Y %H:%M"`
echo "Finished to compress db. Starting to move to webserver: "`date +"%m-%d-%Y %H:%M"` >> /home/amaury/temp/Logs/Info.log
cp /home/amaury/temp/DBRar/blockchain_v2_mainnet.sqlite_in_progress.rar /home/amaury/temp/WebServerSync
rm -f /home/amaury/temp/WebServerSync/db_v2_mainnet.rar
mv /home/amaury/temp/WebServerSync/blockchain_v2_mainnet.sqlite_in_progress.rar /home/amaury/temp/WebServerSync/db_v2_mainnet.rar

echo "Finished to move to webserver: "`date +"%m-%d-%Y %H:%M"`

echo "Done with script: "`date +"%m-%d-%Y %H:%M"` >> /home/amaury/temp/Logs/Info.log
echo "_______________________________________________________"  >> /home/amaury/temp/Logs/Info.log
