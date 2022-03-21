#!/bin/bash
DIR=/opt/keg
docker run -d --name keg -v $DIR:/app -p 5050:5000 keg:latest

