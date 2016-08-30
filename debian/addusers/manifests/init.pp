# Class: users
#
# This module ensure certain users are present along with their
# password exist and are present on the defined system.
#
# To generate new hash execute 'openssl passwd -1'.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#  include addusers
# 

class addusers {

	user { 'meo':
		ensure => present,
        password => '$1$iNH/fESQ$9dPvK3lQmCXM8l71rfqly0',
        groups => ["users","audio"],
	}
    
    file { '/etc/sudoers':
        path    => '/etc/sudoers',
        ensure  => file,
        source  => "puppet:///modules/${module_name}/sudoers",
        owner   => '0',
        group   => '0',
        mode    => '0440',
    }
    
    file { '/etc/sudoers.d/meo':
        path    => '/etc/sudoers.d/meo',
        ensure  => file,
        source  => "puppet:///modules/${module_name}/meo",
        owner   => '0',
        group   => '0',
        mode    => '0440',
    }
}