# Class: httpdconf
#
# This module 
#
# Parameters:
#
# [*example*]
#   Specify configuration file to use
#   e.g. "httpd.conf.default or httpd.conf.webservers"
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include serviceverify
#
# [Remember: No empty lines between comments and class definition]
#
class serviceverify {
  service { 'httpd':
    name      => 'httpd',
    ensure    => running,
    enable    => true,
    hasstatus => true,
    hasrestart => true,
  }
}

