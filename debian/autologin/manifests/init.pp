# Class: autologin
#
# This module configure all aspects of autologin
#
# Parameters:
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
#  include autologin
#

class autologin (
  $version = 'installed',
) {
    
  package { 'lightdm':
    ensure => $version,
  }

  file { 'lightdm.conf':
    path    => '/etc/lightdm/lightdm.conf',
    ensure  => file,
    require => Package['lightdm'],
    source  => "puppet:///modules/${module_name}/lightdm.conf",
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
  service { 'lightdm':
    name      => 'lightdm',
    ensure    => running,
    enable    => true,
    hasstatus => true,
    hasrestart => true,
    subscribe => File['lightdm.conf'],
  }
}

