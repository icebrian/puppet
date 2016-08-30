# Class: tint2
#
# This module ensures tint2 is installed and configured
# and all required files/scripts are made available.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include xorg
#

class xorg () {
    
  file { '/etc/X11/xorg.conf':
    path    => '/etc/X11/xorg.conf',
    ensure  => file,
    source  => "puppet:///modules/${module_name}/xorg.conf",
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
}
