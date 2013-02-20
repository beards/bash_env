#!/bin/bash

SCRIPT_NAME=${BASH_SOURCE[0]}
BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../  && pwd )"
DATE=$(date -d "today" +"%Y%m%d%H%M")

source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "debian" ]; then
    sudo apt-key add $BASH_ENV_DIR/scripts/mongodb/10gen-gpg-key.asc
    sudo cp $BASH_ENV_DIR/scripts/mongodb/10gen.list /etc/apt/sources.list.d/
    sudo apt-get update
    sudo apt-get install mongodb-10gen
fi
