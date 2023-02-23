# SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com>
#
# SPDX-License-Identifier: AGPL-3.0-only

@ENTRIES = (
   {
      "dir"             => "zm-mailbox",
      "mvn_targets"     => ["compile"],
      "deploy_pkg_into" => "bundle",
      "stage_cmd"       => sub {
         SysExec("(cp -r store ../zm-ldap-utilities)");
         SysExec("mkdir -p                                 $CFG{BUILD_DIR}/zm-mailbox/store-conf/");
         SysExec("rsync -az store-conf/conf                $CFG{BUILD_DIR}/zm-mailbox/store-conf/");
      },
   },
   {
      "dir"         => "junixsocket/junixsocket-native",
      "mvn_targets" => ["package"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/junixsocket/junixsocket-native/build");
         SysExec("cp -f target/nar/junixsocket-native-*/lib/*/jni/libjunixsocket-native-*.so $CFG{BUILD_DIR}/junixsocket/junixsocket-native/build/");
         SysExec("cp -f target/junixsocket-native-*.nar  $CFG{BUILD_DIR}/junixsocket/junixsocket-native/build/");
      },
   },
   {
      "dir"         => "zm-taglib",
      "ant_targets" => ["publish-local"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-taglib/build");
         SysExec("cp -f build/zm-taglib*.jar  $CFG{BUILD_DIR}/zm-taglib/build/");
      },
   },
   {
      "dir"         => "zm-charset",
      "ant_targets" => ["publish-local"],
      "stage_cmd"   => undef,
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
      "dir"         => "zm-ajax",
      "ant_targets" => ["publish-local"],
      "stage_cmd"   => undef,
   },
   {
      "dir"         => "zm-admin-ajax",
      "ant_targets" => ["publish-local"],
      "stage_cmd"   => undef,
   },
   {
      "dir"         => "zm-ssdb-ephemeral-store",
      "ant_targets" => ["publish-local"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-ssdb-ephemeral-store/build/dist");
         SysExec("cp -f build/zm-ssdb-ephemeral-store*.jar $CFG{BUILD_DIR}/zm-ssdb-ephemeral-store/build/dist");
      },
   },
   {
      "dir"         => "zm-openid-consumer-store",
      "ant_targets" => ["dist-package"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-openid-consumer-store/build/dist");
         SysExec("cp -f -r build/dist $CFG{BUILD_DIR}/zm-openid-consumer-store/build/");
      },
   },
   {
      "dir"         => "zm-clam-scanner-store",
      "ant_targets" => ["publish-local"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-clam-scanner-store/build/dist");
         SysExec("cp -f -rp build/zm-clam-scanner-store-*.jar $CFG{BUILD_DIR}/zm-clam-scanner-store/build/dist");
      },
   },
   {
      "dir"         => "zm-nginx-lookup-store",
       "mvn_targets" => ["package"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-nginx-lookup-store/build/dist");
         SysExec("cp -f -rp target/zm-nginx-lookup-store-*.jar $CFG{BUILD_DIR}/zm-nginx-lookup-store/build/dist");
      },
   },
   {
      "dir"         => "zm-certificate-manager-admin-zimlet",
      "ant_targets" => ["package-zimlet"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-certificate-manager-admin-zimlet/build/zimlet");
         SysExec("cp -f build/zimlet/*.zip $CFG{BUILD_DIR}/zm-certificate-manager-admin-zimlet/build/zimlet");
      },
   },
   {
      "dir"         => "zm-proxy-config-admin-zimlet",
      "ant_targets" => ["package-zimlet"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-proxy-config-admin-zimlet/build/zimlet");
         SysExec("cp -f build/zimlet/*.zip $CFG{BUILD_DIR}/zm-proxy-config-admin-zimlet/build/zimlet");
      },
   },
   {
      "dir"         => "zm-helptooltip-zimlet",
      "ant_targets" => ["package-zimlet"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-helptooltip-zimlet/build/zimlet");
         SysExec("cp -f build/zimlet/*.zip $CFG{BUILD_DIR}/zm-helptooltip-zimlet/build/zimlet");
      },
   },
   {
      "dir"         => "zm-viewmail-admin-zimlet",
      "ant_targets" => ["package-zimlet"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-viewmail-admin-zimlet/build/zimlet");
         SysExec("cp -f build/zimlet/*.zip $CFG{BUILD_DIR}/zm-viewmail-admin-zimlet/build/zimlet");
      },
   },
   {
      "dir"         => "zm-zimlets",
      "ant_targets" => [ "package-zimlets", "jar" ],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-zimlets/conf");
         SysExec("cp -f conf/zimbra.tld $CFG{BUILD_DIR}/zm-zimlets/conf");
         SysExec("cp -f conf/web.xml.production $CFG{BUILD_DIR}/zm-zimlets/conf");
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-zimlets/build/dist/zimlets");
         SysExec("cp -f build/dist/zimlets/*.zip $CFG{BUILD_DIR}/zm-zimlets/build/dist/zimlets");
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-zimlets/build/dist");
         SysExec("cp -f build/zm-zimlets-*.jar $CFG{BUILD_DIR}/zm-zimlets/build/dist/zimlettaglib.jar");
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
      "dir"         => "zm-certificate-manager-store",
      "mvn_targets" => ["package"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-certificate-manager-store");
         SysExec("cp -f -r ../zm-certificate-manager-store/target $CFG{BUILD_DIR}/zm-certificate-manager-store");
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
   
   {
      "dir"         => "zm-oauth-social",
      "ant_targets" => ["publish-local", "oauth-social-common-jar", "oauth-social-jar"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-oauth-social/build/dist");
         SysExec("cp -f -rp build/zm-oauth-social*.jar $CFG{BUILD_DIR}/zm-oauth-social/build/dist");
      },
   },
   
   {
      "dir"         => "zm-gql",
      "ant_targets" => ["publish-local"],
      "stage_cmd"   => sub {
         SysExec("mkdir -p $CFG{BUILD_DIR}/zm-gql/build/dist");
         SysExec("cp -f -rp build/zm-gql-*.jar $CFG{BUILD_DIR}/zm-gql/build/dist");
      },
   },
);
