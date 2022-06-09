#!/bin/bash

# SPDX-FileCopyrightText: 2022 Synacor, Inc.
# SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com>
#
# SPDX-License-Identifier: GPL-2.0-only

# Shell script to create mta package

#-------------------- Configuration ---------------------------

currentScript=$(basename $0 | cut -d "." -f 1)                 # carbonio-mta
currentPackage=$(echo ${currentScript}build | cut -d "-" -f 2) # mtabuild

#-------------------- Build Package ---------------------------
main() {
  echo -e "\tCreate package directories"
  mkdir -p ${repoDir}/zm-build/${currentPackage}/opt/zextras/common/conf
  mkdir -p ${repoDir}/zm-build/${currentPackage}/opt/zextras/data/amavisd/mysql
  mkdir -p ${repoDir}/zm-build/${currentPackage}/opt/zextras/data/altermime
  mkdir -p ${repoDir}/zm-build/${currentPackage}/opt/zextras/data/cbpolicyd/db
  mkdir -p ${repoDir}/zm-build/${currentPackage}/opt/zextras/data/clamav
  mkdir -p ${repoDir}/zm-build/${currentPackage}/opt/zextras/data/opendkim
  mkdir -p ${repoDir}/zm-build/${currentPackage}/opt/zextras/data/postfix

  # mkdir for consul mta
  mkdir -p ${repoDir}/zm-build/${currentPackage}/usr/bin/
  mkdir -p ${repoDir}/zm-build/${currentPackage}/lib/systemd/system
  mkdir -p ${repoDir}/zm-build/${currentPackage}/etc/zextras/service-discover
  mkdir -p ${repoDir}/zm-build/${currentPackage}/etc/zextras/pending-setups.d
  mkdir -p ${repoDir}/zm-build/${currentPackage}/etc/carbonio/mta/service-discover

  echo -e "\tCopy package files"
  cp ${repoDir}/zm-postfix/conf/postfix/master.cf.in             ${repoDir}/zm-build/${currentPackage}/opt/zextras/common/conf/master.cf.in
  cp ${repoDir}/zm-postfix/conf/postfix/tag_as_foreign.re.in     ${repoDir}/zm-build/${currentPackage}/opt/zextras/common/conf/tag_as_foreign.re.in
  cp ${repoDir}/zm-postfix/conf/postfix/tag_as_originating.re.in ${repoDir}/zm-build/${currentPackage}/opt/zextras/common/conf/tag_as_originating.re.in
  cp -f ${repoDir}/zm-amavis/conf/amavisd/mysql/antispamdb.sql   ${repoDir}/zm-build/${currentPackage}/opt/zextras/data/amavisd/mysql/antispamdb.sql

  # consul mta
  cp ${repoDir}/zm-mta/package/carbonio-mta                      ${repoDir}/zm-build/${currentPackage}/usr/bin/carbonio-mta
  cp ${repoDir}/zm-mta/package/carbonio-mta-sidecar.service      ${repoDir}/zm-build/${currentPackage}/lib/systemd/system/carbonio-mta-sidecar.service
  cp ${repoDir}/zm-mta/package/carbonio-mta.hcl                  ${repoDir}/zm-build/${currentPackage}/etc/zextras/service-discover/carbonio-mta.hcl
  cp ${repoDir}/zm-mta/package/carbonio-mta-setup.sh             ${repoDir}/zm-build/${currentPackage}/etc/zextras/pending-setups.d/carbonio-mta.sh
  cp ${repoDir}/zm-mta/package/policies.json                     ${repoDir}/zm-build/${currentPackage}/etc/carbonio/mta/service-discover/policies.json
  cp ${repoDir}/zm-mta/package/intentions.json                   ${repoDir}/zm-build/${currentPackage}/etc/carbonio/mta/service-discover/intentions.json
  cp ${repoDir}/zm-mta/package/service-protocol.json             ${repoDir}/zm-build/${currentPackage}/etc/carbonio/mta/service-discover/service-protocol.json

}

#-------------------- Util Functions ---------------------------

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$SCRIPT_DIR/utils.sh"

############################################################################
main "$@"
