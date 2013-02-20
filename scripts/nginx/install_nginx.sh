#!/bin/bash

SCRIPT_NAME=${BASH_SOURCE[0]}
BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../  && pwd )"
DATE=$(date -d "today" +"%Y%m%d%H%M")

source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "debian" ]; then
    sudo add-apt-repository ppa:nginx/stable
    sudo apt-get update
    sudo apt-get install nginx
fi
