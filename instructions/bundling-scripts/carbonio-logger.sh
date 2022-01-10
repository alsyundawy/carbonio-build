#!/bin/bash

# SPDX-FileCopyrightText: 2022 Synacor, Inc.
# SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com>
#
# SPDX-License-Identifier: GPL-2.0-only

# Shell script to create logger package

#-------------------- Configuration ---------------------------

currentScript=$(basename $0 | cut -d "." -f 1)                 # carbonio-logger
currentPackage=$(echo ${currentScript}build | cut -d "-" -f 2) # loggerbuild

#-------------------- Build Package ---------------------------

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$SCRIPT_DIR/utils.sh"

main() {
  echo -e "\tCreate package directories..."
  mkdir -p ${repoDir}/zm-build/${currentPackage}/opt/zextras/logger/db/data
}

############################################################################
main "$@"
