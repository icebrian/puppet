# Class: hostname
#
# This module manages the hosts and hostname
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include hostname
#

class hostname {

  file { '/etc/hosts':
    ensure  => file,
    content => template("${module_name}/hosts.erb"),
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
  file { '/etc/hostname':
    ensure  => file,
    content => template("${module_name}/hostname.erb"),
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
  if $os == 'Debian' {
    exec { 'hostname.sh':
      command => 'hostname.sh',
      path    => [ '/etc/init.d/'],
      subscribe => File['/etc/hostname'],
      refreshonly => true,
    }
  } else {
    $mac = delete($macaddress, ':')

    exec { "hostname RPI$mac":
      command => "hostname RPI$mac",
      path    => [ '/bin/'],
      subscribe => File['/etc/hostname'],
      refreshonly => true,
    }
  }
  
}
