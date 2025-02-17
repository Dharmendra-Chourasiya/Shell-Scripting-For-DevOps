#!/bin/bash


echo "Update the packages"
sudo apt-get update

echo "Docker Install"
sudo apt-get install docker.io

sleep 20

echo "Provide the Permission to USER to communicate with Docker"
sudo chown $USER /var/run/docker.sock 

echo "Docker Setup Succesfully"


