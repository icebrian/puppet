# Class: sshd
#
# This module can ensure sshd is installed and running allowing
# administrator to specifically select a version and configuration
# file. The config file will also be applied acording to puppet
# environment machine resides in (see /files/).
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
# [*os*]
#   Operating system, Ie Red Hat, Debian, etc.
#
# [*release*]
#   Operating system release. Ie: Red Hat release 7
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include sshd
#

class sshd (
  $version = 'installed',
  $os = $::operatingsystem,
  $release = $::operatingsystemrelease,
) {
    
  package { 'openssh-server':
    ensure => $version,
  }

  file { 'sshd_config':
    path    => '/etc/ssh/sshd_config',
    ensure  => file,
    require => Package['openssh-server'],
    source  => "puppet:///modules/${module_name}/${os}/${release}/sshd_config",
    owner   => '0',
    group   => '0',
    mode    => '0600',
  }
  
  file { 'banner':
    path    => '/etc/banner',
    ensure  => file,
    content => template("${module_name}/banner.erb"),
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
  $service = $os ? {
    Ubuntu => 'ssh',
    Debian => 'ssh',
    RedHat => 'sshd',
    default => 'ssh',
  }

  service { $service:
    name      => $service,
    ensure    => running,
    enable    => true,
    hasstatus => true,
    hasrestart => true,
    subscribe => File['sshd_config'],
  }
}

