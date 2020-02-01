#!/bin/bash

usage() {
  cat << EOF
Execute your commands on the target cluster with ansible
Usage:
  $(basename $0) CLUSTER_NAME COMMAND1 COMMAND2(ARG1) COMMAND3(ARG2) ...
Example:
  # Get the result of "uname -n" on util servers
  $(basename $0) util uname -n
EOF
}

if [ $# -lt 2 ]; then
  usage
  exit 1
fi

ansible $1 -m shell -a "`echo \"${@:2:$#-1}\"`"
