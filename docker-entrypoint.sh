#!/bin/bash

count=`cat /app/config/database.txt | wc -l`
current=1

for database in `cat /app/config/database.txt` ; do 
    echo "${count}/${current} - ${database} - DROP"; 
   
    mysqladmin --host=${HOST} --user=${USERNAME} --password=${PASSWORD} --force drop ${database} &> "/tmp/${database}.sql" 

    if [ "$?" -eq 0 ]
    then
        echo "${count}/${current} - ${database} - OK";
    else
        mv "/tmp/${database}.sql" "/app/error/${database}.sql";
        echo "${count}/${current} - ${database} - FALHA"; 
    fi
    
    current=$((current+1)); 
    echo "Drop concluido,  aguadando a execução do proximo ...";
    sleep 10; 
done
