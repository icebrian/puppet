# Class: tint2
#
# This module ensures Raspberry Pi main config files 
# exist and are placed correctly.
# Note: This is for Debian distros. Raspbian for example
# places files directly in /boot
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include rpiconfig
#

class rpiconfig () {
    
  file { '/boot/firmware/config.txt':
    path    => '/boot/firmware/config.txt',
    ensure  => file,
    source  => "puppet:///modules/${module_name}/config.txt",
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
}
