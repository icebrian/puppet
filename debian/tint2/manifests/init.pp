# Class: tint2
#
# This module ensures tint2 is installed and configured
# and all required files/scripts are made available.
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
#  include tint2
#

class tint2 (
  $version = 'installed',
) {
    
  package { 'tint2':
    ensure => $version,
  }

  file { '/usr/share/pixmaps/':
    path    => '/usr/share/pixmaps/',
    ensure  => directory,
    require => Package['tint2'],
    source  => "puppet:///modules/${module_name}/pixmaps",
    owner   => '0',
    group   => '0',
    mode    => '0644',
    recurse => true,
  }
  
  file { '/usr/share/applications/':
    path    => '/usr/share/applications/',
    ensure  => directory,
    require => Package['tint2'],
    source  => "puppet:///modules/${module_name}/desktop",
    owner   => '0',
    group   => '0',
    mode    => '0644',
    recurse => true,
  }
  
  file { '/usr/local/bin/':
    path    => '/usr/local/bin/',
    ensure  => directory,
    require => Package['tint2'],
    source  => "puppet:///modules/${module_name}/scripts",
    owner   => '0',
    group   => '0',
    mode    => '0755',
    recurse => true,
  }
  
  file { '/home/meo/.config/':
    path    => '/home/meo/.config/',
    ensure  => directory,
    require => Package['tint2'],
    owner   => 'meo',
    group   => 'meo',
    mode    => '0644',
    recurse => true,
  }
  
  file { '/home/meo/.config/tint2/':
    path    => '/home/meo/.config/tint2/',
    ensure  => directory,
    require => File['/home/meo/.config/'],
    source  => "puppet:///modules/${module_name}/tint2",
    owner   => 'meo',
    group   => 'meo',
    mode    => '0644',
    recurse => true,
  }
  
}

