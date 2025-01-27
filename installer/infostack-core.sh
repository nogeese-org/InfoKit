#!/bin/bash

echo "Please wait while InfoStack Core0 (Beta) is being installed."

echo "Building directories..."
sudo mkdir /usr/infostack/program/data/core0/
sudo mkdir /usr/infostack/pkg/org.neocities-leon8326.Nogeese.InfoStack.core0/
sudo echo "0" > /usr/infostack/pkg/org.neocities-leon8326.Nogeese.InfoStack.core0/version.txt
sudo echo "https://raw.githubusercontent.com/leon8326-nogeese/InfoKit/main/infostacks/core0builddata/infostack.sh" > /usr/infostack/pkg/org.neocities-leon8326.Nogeese.InfoStack.core0/source.txt
sudo curl -sSL https://raw.githubusercontent.com/leon8326-nogeese/InfoKit/main/infostacks/core0builddata/infostack.sh >> /usr/infostack/pkg/org.neocities-leon8326.Nogeese.InfoStack.core0/infostack.sh
echo "Core installation complete!"
