#!/bin/bash

PROXY_DEFAULT=""
PROXY_WITHOUT_DEFAULT="localhost,127.0.0.1,localaddress,.localdomain.com"

if [ "$PROXY" == "" ]; then
    PROXY=$PROXY_DEFAULT
fi

function SetProxyUrl () {
    export PROXY=$1
}

function GetProxyUrl () {
    echo $PROXY
}

function SetProxy () {
    PROXY=$1
    echo "Set Proxy : $PROXY"

    # gnome session
    sed -i 's#http_proxy=.*#'"http_proxy=${PROXY}"'#g' /etc/environment 1>/dev/null 2>/dev/null
    cat /etc/environment 2>/dev/null | grep http_proxy 1>/dev/null 2>/dev/null
    if [ $? != 0 ];then
        echo "http_proxy=\"$PROXY\"" >> /etc/environment
    fi
    sed -i 's#https_proxy=.*#'"https_proxy=${PROXY}"'#g' /etc/environment 2>/dev/null
    cat /etc/environment 2>/dev/null | grep https_proxy 1>/dev/null 2>/dev/null
    if [ $? != 0 ];then
        echo "https_proxy=\"$PROXY\"" >> /etc/environment
    fi
    sed -i 's#ftp_proxy=.*#'"ftp_proxy=${PROXY}"'#g' /etc/environment 2>/dev/null
    cat /etc/environment 2>/dev/null | grep ftp_proxy 1>/dev/null 2>/dev/null
    if [ $? != 0 ];then
        echo "ftp_proxy=\"$PROXY\"" >> /etc/environment
    fi

    # atom editor
    CONF_FILE="~/.atom/.apmrc"
    sed -i 's#http-proxy=.*#'"http-proxy=${PROXY}"'#g' "$CONF_FILE" 2>/dev/null
    cat "$CONF_FILE" 2>/dev/null | grep http-proxy 1>/dev/null 2>/dev/null
    if [ $? != 0 ];then
        touch "$CONF_FILE" 2>/dev/null
        echo "http-proxy=\"$PROXY\"" 2>/dev/null >> "$CONF_FILE" 2>/dev/null
    fi
    sed -i 's#https_proxy=.*#'"https-proxy=${PROXY}"'#g' "$CONF_FILE" 2>/dev/null
    cat "$CONF_FILE" 2>/dev/null | grep https-proxy 1>/dev/null 2>/dev/null
    if [ $? != 0 ];then
        touch "$CONF_FILE" 2>/dev/null
        echo "https-proxy=\"$PROXY\"" 2>/dev/null >> "$CONF_FILE" 2>/dev/null
    fi

    # bash
    export http_proxy=$PROXY
    export https_proxy=$PROXY
    export ftp_proxy=$PROXY
    export no_proxy="$PROXY_WITHOUT_DEFAULT"

    export HTTP_PROXY=$PROXY
    export HTTPS_PROXY=$PROXY
    export FTP_PROXY=$PROXY
    export NO_PROXY="$PROXY_WITHOUT_DEFAULT"

    # apt
    sed -i "s#Acquire::ftp::proxy.*#Acquire::ftp::proxy \"$PROXY\";#g" /etc/apt/apt.conf 2>/dev/null
    sed -i "s#Acquire::http::proxy.*#Acquire::http::proxy \"$PROXY\";#g" /etc/apt/apt.conf 2>/dev/null
    sed -i "s#Acquire::https::proxy.*#Acquire::https::proxy \"$PROXY\";#g" /etc/apt/apt.conf 2>/dev/null
    echo "Acquire::ftp::proxy \"$PROXY\";" 2>/dev/null > /etc/apt/apt.conf.d/99proxy 2>/dev/null
    echo "Acquire::http::proxy \"$PROXY\";" 2>/dev/null >> /etc/apt/apt.conf.d/99proxy 2>/dev/null
    echo "Acquire::https::proxy \"$PROXY\";" 2>/dev/null >> /etc/apt/apt.conf.d/99proxy 2>/dev/null

    # curl
    if [ -e ~/.curlrc ]; then
        sed -i '/^proxy=/proxy=$PROXY/' ~/.curlrc
        if [ $? != 0 ]; then
            echo "proxy=$PROXY" >> ~/.curlrc
        fi
    fi

    # wgetrc
    if [ -e ~/.wgetrc ]; then
        sed -i '/^http_proxy=/http_proxy=$PROXY/' ~/.wgetrc
        if [ $? != 0 ]; then
            echo "http_proxy=$PROXY" >> ~/.curlrc
        fi
    fi

    # git
    git config --global http.proxy $PROXY
    sed -i 's#proxy.*#'"    proxy = ${PROXY}"'#g' ~/.gitconfig 1>/dev/null 2>/dev/null

    # ruby gem
    if [ -e ~/.gemrc ]; then
        sed -i '/^http_proxy=/http_proxy=$PROXY/' ~/.gemrc
        if [ $? != 0 ]; then
            echo "http_proxy=$PROXY" >> ~/.gemrc
        fi
    fi

    # docker
    if [ -e /etc/default/docker ]; then
        sed -i "s#^export http_proxy.*#export http_proxy=$PROXY#g" /etc/default/docker 2>/dev/null
        sed -i "s#^export HTTP_PROXY.*#export HTTP_PROXY=$PROXY#g" /etc/default/docker 2>/dev/null
        grep "^export HTTP_PROXY" /etc/default/docker 1>/dev/null 2>/dev/null
        if [ $? != 0 ]; then
            echo "export http_proxy=$PROXY" >> /etc/default/docker
            echo "export HTTP_PROXY=$PROXY" >> /etc/default/docker
        fi

        sed -i "s#^export https_proxy.*#export https_proxy=$PROXY#g" /etc/default/docker 2>/dev/null
        sed -i "s#^export HTTPS_PROXY.*#export HTTPS_PROXY=$PROXY#g" /etc/default/docker 2>/dev/null
        grep "^export HTTPS_PROXY" /etc/default/docker 1>/dev/null 2>/dev/null
        if [ $? != 0 ]; then
            echo "export https_proxy=$PROXY" 2>/dev/null >> /etc/default/docker
            echo "export HTTPS_PROXY=$PROXY" 2>/dev/null >> /etc/default/docker
        fi
    fi


    ShowProxy
}

function UnsetProxy () {
    SetProxy ""
}

function ShowProxy () {
    echo "configured $http_proxy [bash, environment, apt, curl, wget, ruby-gem, docker]"
}

function ShowProxyDebug () {
    echo "[bash]"
    echo "http_proxy = $http_proxy"
    echo "https_proxy = $https_proxy"
    echo "ftp_proxy = $ftp_proxy"
    echo "HTTP_PROXY = $HTTP_PROXY"
    echo "HTTPS_PROXY = $HTTPS_PROXY"
    echo "FTP_PROXY = $FTP_PROXY"
    echo

    echo "[environment]"
    cat /etc/environment
    echo

    echo "[apt]"
    cat /etc/apt/apt.conf.d/99proxy
    echo

    echo "[curl]"
    cat ~/.curlrc 2>/dev/null || echo "  --- not found a file: ~/.curlrc"
    echo

    echo "[wget]"
    cat ~/.wgetrc 2>/dev/null || echo "  --- not found a file: ~/.wgetrc"
    echo
   
    echo "[Ruby::gem]"
    cat ~/.gemrc 2>/dev/null || echo "  --- not found a file: ~/.gemrc"
    echo

    echo "[docker]"
    cat /etc/default/docker |grep proxy 2>/dev/null || echo "  --- not found a file: /etc/default/docker"
    echo
   
   
}

function TestProxy () {
    echo " -- bash -- "
    echo $http_proxy
    echo

    echo " -- apt -- "
    apt search kernel  1>/dev/null 2>/dev/null; echo $?

    echo " -- curl -- "
    curl -I http://www.google.com/; echo $?

    echo " -- wget -- "
    wget http://www.google.com/; echo $? 

}
