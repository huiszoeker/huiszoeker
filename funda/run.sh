#!/bin/bash

KIND=$1
PLACE=$2

CYPRESS_KIND=${KIND} CYPRESS_PLACE=${PLACE} cypress run --spec cypress/integration/gather_urls.spec.js

cd server 
KIND=$KIND PLACE=$PLACE npm run server &
SERVER_PID=$!
cd ..

sleep 5

cat ${KIND}_${PLACE}_urls.txt | while read line
do
   echo $line
   sleep 10
   for i in `seq 1 3`;
   do
   	  echo $i
   	  CYPRESS_URL=$line cypress run --spec cypress/integration/house.spec.js   
   	  if [ "$?" == 0 ]
 	  then
        break
      fi
   done 
done

sleep 10
kill $SERVER_PID