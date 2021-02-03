#!/usr/bin/bash

BUNDLE=$1
if [ -n "$2" ]; then
    REPO=$2
    if [ ! -z $REPO ]
    then
        echo "Installing repo: $REPO"
        yum install -y http://linux.mirrors.es.net/perfsonar/el7/x86_64/4/packages/perfSONAR-repo-$REPO-0.10-1.noarch.rpm 
    else
        echo "REPO not specified; using PRODUCTION"
        yum install -y http://linux.mirrors.es.net/perfsonar/el7/x86_64/4/packages/perfSONAR-repo-0.10-1.noarch.rpm
    fi
fi
echo "Executing yum install -y \"$BUNDLE\""
yum install -y epel-release && \
yum install -y http://linux.mirrors.es.net/perfsonar/el7/x86_64/4/packages/perfSONAR-repo-0.10-1.noarch.rpm
yum install -y "$BUNDLE"

