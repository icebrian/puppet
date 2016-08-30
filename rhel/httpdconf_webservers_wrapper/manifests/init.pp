# Class: httpdconf
#
# This module 
#
# Parameters:
#
# [*conf_file*]
#   Specify configuration file to use
#   e.g. "httpd.conf.default or httpd.conf.webservers"
#
# [*version*]
#   Specify version to use if required.
#   Options: installed | latest | 2.2.15-39.el6
#     installed - Makes sure any version is installed
#     latest - Makes sure the latest version is installed
#     2.2.15-39.el6 - Ensures specific version is installed
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include httpdconf_webservers_wrapper
#
# [Remember: No empty lines between comments and class definition]
#
class httpdconf_webservers_wrapper (
  $conf_file = 'httpd.conf.webservers',
  $version = 'installed',
) {

  class { 'httpdconf':
    version => $version,
    conf_file => $conf_file,
  }
}


