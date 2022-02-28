# SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com>
#
# SPDX-License-Identifier: AGPL-3.0-only

@ENTRIES = (
   {
      "dir"         => "zm-build",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("cp -f -r ../zimlets $CFG{BUILD_DIR}");
         SysExec("cp -f -r ../ldap-resources $CFG{BUILD_DIR}");
      },
   },
   {
      "dir"         => "zm-ldap-utilities",
      "ant_targets" => ["build-dist"],
      "stage_cmd"   => sub {
         SysExec("(cd .. && rsync -az --relative zm-ldap-utilities/build/dist $CFG{BUILD_DIR}/)");
         SysExec("(cd .. && rsync -az --relative zm-ldap-utilities/src/ldap/migration $CFG{BUILD_DIR}/)");
         SysExec("(cd .. && rsync -az --relative zm-ldap-utilities/conf $CFG{BUILD_DIR}/)");
         SysExec("(cd .. && rsync -az --relative zm-ldap-utilities/src/libexec $CFG{BUILD_DIR}/)");
      },
   },
   {
      "dir"         => "zm-db-conf",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("(cd .. && rsync -az --relative zm-db-conf/src/db/migration $CFG{BUILD_DIR}/)");
         SysExec("(cd .. && rsync -az --relative zm-db-conf/src/db/mysql     $CFG{BUILD_DIR}/)");
      },
   },
   {
      "dir"         => "zm-amavis",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("cp -f -r ../zm-amavis $CFG{BUILD_DIR}");
      },
   },
   {
      "dir"         => "zm-postfix",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("cp -f -r ../zm-postfix $CFG{BUILD_DIR}");
      },
   },
   {
      "dir"         => "zm-core-utils",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("cp -f -r ../zm-core-utils $CFG{BUILD_DIR}");
      },
   },
   {
      "dir"         => "zm-jython",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("(cd .. && rsync -az --relative zm-jython $CFG{BUILD_DIR}/)");
      },
   },
   {
      "dir"         => "zm-mta",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("(cd .. && rsync -az --relative zm-mta $CFG{BUILD_DIR}/)");
      },
   },
   {
      "dir"         => "zm-freshclam",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("(cd .. && rsync -az --relative zm-freshclam $CFG{BUILD_DIR}/)");
      },
   },
   {
      "dir"          => "zm-launcher",
      "make_targets" => ["JAVA_BINARY=/opt/zextras/common/bin/java"],
      "stage_cmd"    => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-launcher/build/dist");
         SysExec("cp -f build/zmmailboxd* $CFG{BUILD_DIR}/zm-launcher/build/dist");
      },
   },
   {
      "dir"         => "zm-jetty-conf",
      "ant_targets" => undef,
      "stage_cmd"   => sub {
         SysExec("cp -f -r ../zm-jetty-conf $CFG{BUILD_DIR}");
      },
   },
);
