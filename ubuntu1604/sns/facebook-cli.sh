#!/bin/bash

sudo gem install facebook-cli

# have to setup login-app in the facebook from browser.

grep "alias for facebook-cli" ~/.bashrc >/dev/null 2>&1
if [ $? != 0 ]; then
cat << EOT >> ~/.bashrc
# alias for facebook-cli
alias fc='facebook-cli'
alias fl='facebook-cli login'
alias fp='facebook-cli post'
EOT
fi

alias fc='facebook-cli'
alias fl='facebook-cli login'
alias fp='facebook-cli post'
