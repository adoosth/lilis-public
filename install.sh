#!/bin/bash
# Description: Install LILIS Server
# Path: install.sh

# Define GitHub URL
githuburl="git@github.com:adoosth/lilis.git"


echo "Enter directory for lilis installation (Default: /home/ubuntu):"
read homedir
if [ -z "$homedir" ]
then
    homedir="/home/ubuntu"
fi

cd $homedir/

# Get GitHub private key as multiline string
echo "Enter GitHub Private Key"
githubprivatekey=$(sed '/^$/q')
# Add GitHub to known hosts
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
# Add GitHub private key
echo "$githubprivatekey" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
# Clone GitHub repository
git clone $githuburl $homedir/lilis

source $homedir/lilis/lilis-install.sh
