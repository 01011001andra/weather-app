#!/bin/bash

user=root
host=194.163.40.83

path=/var/www/html/weather-app
filename=dist.tar.gz

npm run build

echo "Deploying ${PWD##*/}"

rm -rf $filename

cd dist && tar cvzf ../$filename * && cd ..
scp ./$filename $user@$host:$path
ssh $user@$host "cd $path && tar -xvzf $filename && rm -rf $filename"

rm -rf $filename