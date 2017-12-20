#!/bin/bash -x

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo apt update && \
    sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev


[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

grep rbenv ~/.bashrc >/dev/null 2>&1 
if [ $? -ne 0 ];then
cat << 'EOT' >> ~/.bashrc

# rbenv
export PATH=${HOME}/.rbenv/bin:${PATH} && \
eval "$(rbenv init -)"
EOT

fi


rbenv install -l
rbenv install 2.2.3
rbenv global 2.2.3

