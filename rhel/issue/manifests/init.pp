# Class: issue
#
# This module can ensure httpd is installed and running allowing
# administrator to specifically select a version and configuration
# file. The config file will also be applied acording to puppet
# environment machine resides in (see /files/).
#
# Parameters:
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
class issue (
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

