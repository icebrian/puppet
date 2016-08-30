# Class: httpdconf
#
# This module can ensure httpd is installed and running allowing
# administrator to specifically select a version and configuration
# file. The config file will also be applied acording to puppet
# environment machine resides in (see /files/).
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
# [*ambiente*]
#   Specify machine environment (specific for VDF)
#   Options: $::ambiente | development | production
#   $$::ambiente - Will choose automatically
#   Provided values will have to be in acordance to dir structure in /files/
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include httpdconf
#
# [Remember: No empty lines between comments and class definition]
#
class httpdconf (
  $conf_file = 'httpd.conf.default',
  $version = 'installed',
  $ambiente = $::ambiente, # Usa facter "ambiente" no caso de não ser fornecido valor
) {
  
  package { 'httpd':
    ensure => $version,
  }

  file { 'httpd.conf':
    path    => '/etc/httpd/conf/httpd.conf',
    ensure  => file,
    require => Package['httpd'],
    source  => "puppet:///modules/httpdconf/${ambiente}/${conf_file}",
  }  

  service { 'httpd':
    name      => 'httpd',
    ensure    => running,
    enable    => true,
    hasstatus => true,
    hasrestart => true,
    subscribe => File['httpd.conf'],
  }
}

