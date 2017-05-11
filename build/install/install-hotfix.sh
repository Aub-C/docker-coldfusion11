#!/bin/bash

# Download the hotfix from Adobe
wget -O /tmp/hotfix_011.jar https://cfdownload.adobe.com/pub/adobe/coldfusion/11/hotfix_011.jar

# Hotfix silent install
/opt/coldfusion11/jre/bin/java -jar /tmp/hotfix_011.jar -f /tmp/installer.hotfix
