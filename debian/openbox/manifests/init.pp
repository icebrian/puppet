# Class: openbox
#
# This module ensures openbox is installed and configured
# acording to sent files.
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
#  include openbox
#

class openbox (
  $version = 'installed',
) {
    
  package { 'openbox':
    ensure => $version,
  }

  file { 'autostart':
    path    => '/etc/xdg/openbox/autostart',
    ensure  => file,
    require => Package['openbox'],
    source  => "puppet:///modules/${module_name}/autostart",
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
  file { 'menu.xml':
    path    => '/home/meo/.config/openbox/menu.xml',
    ensure  => file,
    require => Package['openbox'],
    source  => "puppet:///modules/${module_name}/menu.xml",
    owner   => 'meo',
    group   => 'meo',
    mode    => '0644',
  }
  
  file { 'rc.xml':
    path    => '/home/meo/.config/openbox/rc.xml',
    ensure  => file,
    require => Package['openbox'],
    source  => "puppet:///modules/${module_name}/rc.xml",
    owner   => 'meo',
    group   => 'meo',
    mode    => '0644',
  }

}

