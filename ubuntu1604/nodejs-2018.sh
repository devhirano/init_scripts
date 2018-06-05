#!/bin/bash -x

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

grep '~/.nvm' $HOME/.bashrc 2>&1 >/dev/null
if [ $? -ne 0 ];then

cat << EOT >> $HOME/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
EOT

fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


nvm install 9.11.1


