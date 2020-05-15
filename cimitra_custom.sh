#!/bin/bash
# PowerShare Integration Script
CUSTOM_INSTALL_NAME="GroupLink PowerShare"
CIMITRA_SERVER_DIRECTORY="/var/opt/cimitra/server"
BRANDING_DIRECTORY="/var/opt/cimitra/server/branding"
# YAML Files
DOCKER_COMPOSE_YML_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/docker-compose.yml"
DOCKER_COMPOSE_YML_444_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/docker-compose-444.yml"

# IMAGE FILES
PNG_DOWNLOAD_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/powershare.png"
SVG_DOWNLOAD_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/powershare.svg"


function CUSTOM_PRE_INSTALL()
{
sudo mkdir -p ${BRANDING_DIRECTORY} 2> /dev/null

sudo test -d ${BRANDING_DIRECTORY}

declare -i BRANDING_DIRECTORY_EXISTS=`sudo test -d ${BRANDING_DIRECTORY}`
if [ $BRANDING_DIRECTORY_EXISTS -ne 0 ]
then
return 1
fi

sudo cd ${BRANDING_DIRECTORY} 2> /dev/null

declare -i CD_WORKED=`echo $?`

if [ $CD_WORKED -ne 0 ]
then
return 1
fi

sudo curl -LJO ${PNG_DOWNLOAD_FILE} -o ./
sudo curl -LJO ${SVG_DOWNLOAD_FILE} -o ./
}

function CUSTOM_POST_INSTALL()
{
echo ""
echo "Thank you for installing GroupLink PowerShare"
echo ""
}