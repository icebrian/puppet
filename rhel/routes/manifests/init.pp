# Class: routes
#
# This module manages the /etc/sysconfig/network-scripts/route-eth0 file using a template
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include routes
#
# [Remember: No empty lines between comments and class definition]
class routes {

  file { '/etc/sysconfig/network-scripts/route-eth0':
    ensure  => file,
    content => template("${module_name}/route-eth0.erb"),
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
}
