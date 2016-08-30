# Class: rpmdeploy
#
# This module installs specified rpm and checks status
#
# Parameters:
#
# [*package*]
#   Specify package name to install
#   e.g. "httpd"
#
# [*version*]
#   Specify version to use if required.
#   Options: installed | latest | 2.2.15-39.el6
#     installed - Makes sure any version is installed
#     latest - Makes sure the latest version is installed
#     2.2.15-39.el6 - Ensures specific version is installed
#
# [*hasstatus*]
#   Specify if package has sysvinit status
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include rpmdeploy
#
# [Remember: No empty lines between comments and class definition]
class rpmdeploy (
  $package = 'httpd',
  $version = 'installed',
  $service = 'httpd',
  $hasstatus = false,
) {

	if ! defined(Package[$package]) {
	  package { $package:
	    ensure => $version,
	  }
	}
  
  if $hasstatus {
    service { $service:
      name      => $service,
      ensure    => running,
      enable    => true,
      hasstatus => $hasstatus,
      hasrestart => false,
    }
  }
}
