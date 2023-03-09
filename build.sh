#!/bin/bash

clear
echo "Autobuild v0.0.1"
echo "Made by: jorgeju4rez"
echo "Licence: MIT"
echo \	
echo "==== Menu options ===="
echo "1. Docker"
echo "2. Kubernetes"
echo "3. Licence"
echo "4. Exit"
echo "======================"
echo \	

read -p 'Select menu option: ' userOption

case $userOption in
1)
   echo "Docker"
   ;;
2)
   echo "Kubernetes"
   ;;
3) 
   echo "Licence"
   ;;
4)
   echo "Exit"
   ;;
*)
   echo "default"
   ;;
esac