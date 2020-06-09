#!/bin/bash
# Integration Script

# CONSTANTS
CIMITRA_SERVER_DIRECTORY="/var/opt/cimitra/server"
BRANDING_DIRECTORY="${CIMITRA_SERVER_DIRECTORY}/branding"
ICONS_DIRECTORY="${BRANDING_DIRECTORY}/icons"

## VARIABLES FROM HERE BELOW ##
CUSTOM_INSTALL_NAME="GroupLink PowerShare"

# CUSTOM_ADMIN
CUSTOM_ADMIN_ACCOUNT_CHANGE_ENABLED_IN=1
CUSTOM_ADMIN_ACCOUNT_ID_IN="admin@grouplink.com"

# CUSTOM LINKS
CUSTOM_LINK_ONE_NAME="Contact GroupLink"
CUSTOM_LINK_ONE_DESCRIPTION="We Would Like to Hear From You"
CUSTOM_LINK_ONE_ADDRESS="http://grouplink.com/contact-us/"
CUSTOM_LINK_ONE_ENABLED_IN=1

CUSTOM_LINK_TWO_NAME="Welcome to PowerShare"
CUSTOM_LINK_TWO_DESCRIPTION="Learn more about PowerShare"
CUSTOM_LINK_TWO_ADDRESS="http://grouplink.com/products/PowerShare/"
CUSTOM_LINK_TWO_ENABLED_IN=1

CUSTOM_LINK_THREE_NAME="PowerShell Scripting"
CUSTOM_LINK_THREE_DESCRIPTION="A great site for PowerShell Recipes"
CUSTOM_LINK_THREE_ADDRESS="https://docs.microsoft.com/en-us/powershell/scripting/samples/sample-scripts-for-administration?view=powershell-7"
CUSTOM_LINK_THREE_ENABLED_IN=1

CUSTOM_LINK_FOUR_NAME="Linux Commands"
CUSTOM_LINK_FOUR_DESCRIPTION="A great site for Linux commands"
CUSTOM_LINK_FOUR_ADDRESS="https://www.commandlinefu.com/commands/browse"
CUSTOM_LINK_FOUR_ENABLED_IN=1

CUSTOM_LINK_FIVE_NAME="Linux Shell Scripting"
CUSTOM_LINK_FIVE_DESCRIPTION="A great site for Shell Scripting"
CUSTOM_LINK_FIVE_ADDRESS="https://www.tutorialspoint.com/unix/shell_scripting.htm"
CUSTOM_LINK_FIVE_ENABLED_IN=1


# YAML Files
DOCKER_COMPOSE_YML_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/docker-compose.yml"
DOCKER_COMPOSE_YML_444_FILE="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/docker-compose-444.yml"

# BRANDING IMAGE FILES
PNG_FILE_IN="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/powershare.png"

SVG_FILE_IN="https://raw.githubusercontent.com/cimitrasoftware/integrate-powershare/master/powershare.svg"

SVG_FILE_OUT="powershare.svg"

PNG_FILE_OUT="powershare.png"

# Pre-install Function
function CUSTOM_PRE_INSTALL()
{

mkdir -p ${BRANDING_DIRECTORY} 2> /dev/null

mkdir -p ${ICONS_DIRECTORY} 2> /dev/null

test -d ${BRANDING_DIRECTORY} 2> /dev/null

declare -i BRANDING_DIRECTORY_EXISTS=`echo $?`

if [ $BRANDING_DIRECTORY_EXISTS -ne 0 ]
then
return 1
fi

cd ${BRANDING_DIRECTORY} 2> /dev/null

curl -skLJ ${PNG_FILE_IN} -o ./${PNG_FILE_OUT}

curl -skLJ ${SVG_FILE_IN} -o ./${SVG_FILE_OUT}

cp ./*.svg ${ICONS_DIRECTORY}   

cp ./*.png ${ICONS_DIRECTORY}   

}

#Post Install Function
function CUSTOM_POST_INSTALL()
{
echo ""
echo "Thank You For Installing GroupLink PowerShare"
echo ""
}
