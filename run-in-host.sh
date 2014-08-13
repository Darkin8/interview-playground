#!/bin/sh

sudo docker build -t "darkin8/interview" .
sudo docker run -d -p 3000:3000 darkin8/interview

echo "***********************************************"
echo "** And now, some results (after ~10 seconds) **"
echo "***********************************************"

sleep 10
curl localhost:3000

echo "?==> Ask Einstein"
curl localhost:3000/3
