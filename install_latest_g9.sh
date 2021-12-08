#!/bin/bash
# Script to install latest gallium nine
echo "First get the necessary packages"
sudo apt update
sudo apt install libd3dadapter9-mesa libd3dadapter9-mesa:i386 libegl1-mesa libegl1-mesa:i386

echo "Now downloading gallium nine"
cd ~
curl -s https://api.github.com/repos/iXit/wine-nine-standalone/releases/latest \
| grep "gallium-nine-standalone-v*tar.gz" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

echo "And installing it"
tar -xf gallium-nine-standalone-v*tar.gz
mv gallium-nine-standalone .gallium-nine-standalone
cd ~/.gallium-nine-standalone
./nine-install.sh

echo "Clean leftovers"
rm ~/gallium-nine*.tar.gz

echo "And now we should be good to go :)"
