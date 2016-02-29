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
# [*release*]
#   6 or 7 (rhel version) or custom if necessary
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
  $release = $::operatingsystemmajrelease,
) {
  
  package { 'openssh-server':
    ensure => $version,
  }

  file { 'sshd_config':
    path    => '/etc/ssh/sshd_config',
    ensure  => file,
    require => Package['openssh-server'],
    source  => "puppet:///modules/${module_name}/${release}/sshd_config",
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

  service { 'sshd':
    name      => 'sshd',
    ensure    => running,
    enable    => true,
    hasstatus => true,
    hasrestart => true,
    subscribe => File['sshd_config'],
  }
}

