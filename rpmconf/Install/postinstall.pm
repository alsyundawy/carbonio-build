#!/usr/bin/perl
# 
# SPDX-FileCopyrightText: 2022 Synacor, Inc.
# SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com>
#
# SPDX-License-Identifier: GPL-2.0-only
# 

package postinstall;

sub configure {

	if (main::isEnabled("carbonio-directory-server")) {
		main::runAsZextras ("${main::ZMPROV} mcf zimbraComponentAvailable ''");
		main::runAsZextras ("zmlocalconfig -u trial_expiration_date");
	}

  # we set this to true during the install/upgrade
  main::setLocalConfig("ssl_allow_untrusted_certs", "true")
    if $main::newinstall;

  if (main::isEnabled("carbonio-mta") && $main::newinstall) {
    my @mtalist = main::getAllServers("mta");
    if (scalar(@mtalist) gt 1) { 
      main::setLocalConfig("zmtrainsa_cleanup_host", "false")
    } else {
      main::setLocalConfig("zmtrainsa_cleanup_host", "true")
    }
  }
}
-1
