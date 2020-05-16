#!/bin/bash
# PowerShare Integration Script
CUSTOM_INSTALL_NAME="GroupLink PowerShare"
CUSTOM_LINK_NAME="Contact GroupLink"
CUSTOM_LINK_DESCRIPTION="We Would Like to Hear From You"
CUSTOM_LINK_ADDRESS="http://grouplink.com/contact-us/"
CUSTOM_LINK_ENABLED_IN=1
CIMITRA_SERVER_DIRECTORY="/var/opt/cimitra/server"
BRANDING_DIRECTORY="${CIMITRA_SERVER_DIRECTORY}/branding"
ICONS_DIRECTORY="${BRANDING_DIRECTORY}/icons"
# YAML Files
DOCKER_COMPOSE_YML_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/docker-compose.yml"
DOCKER_COMPOSE_YML_444_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/docker-compose-444.yml"

# IMAGE FILES
PNG_FILE_IN="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/powershare.png"
SVG_FILE_IN="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/powershare.svg"

SVG_FILE_OUT="powershare.svg"

PNG_FILE_OUT="powershare.png"

function CUSTOM_PRE_INSTALL()
{
sudo mkdir -p ${BRANDING_DIRECTORY} 2> /dev/null

sudo mkdir -p ${ICONS_DIRECTORY} 2> /dev/null

sudo test -d ${BRANDING_DIRECTORY} 2> /dev/null

declare -i BRANDING_DIRECTORY_EXISTS=`echo $?`

if [ $BRANDING_DIRECTORY_EXISTS -ne 0 ]
then
return 1
fi

cd ${BRANDING_DIRECTORY} 2> /dev/null

echo "curl -LJ ${PNG_FILE_IN} -o ./${PNG_FILE_OUT}"

curl -LJ ${PNG_FILE_IN} -o ./${PNG_FILE_OUT}

curl -LJ ${SVG_FILE_IN} -o ./${SVG_FILE_OUT}

sudo cp ./*.svg ${ICONS_DIRECTORY}   

sudo cp ./*.png ${ICONS_DIRECTORY}   

}

function CUSTOM_POST_INSTALL()
{
echo ""
echo "Thank You For Installing GroupLink PowerShare"
echo ""
}