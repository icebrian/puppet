# Class: rpisplash
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
#  include rpisplash
#

class rpisplash (
  $version = 'installed',
) {
    
  package { 'fbi':
    ensure => $version,
  }
    
  file { '/boot/firmware/cmdline.txt':
    path    => '/boot/firmware/cmdline.txt',
    ensure  => file,
    source  => "puppet:///modules/${module_name}/cmdline.txt",
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
  file { '/usr/share/backgrounds/wallpaper_pt.png':
    path    => '/usr/share/backgrounds/wallpaper_pt.png',
    ensure  => file,
    source  => "puppet:///modules/${module_name}/wallpaper_pt.png",
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
  exec { 'update-initramfs -u -t':
    command => 'update-initramfs -u -t',
    path    => [ '/usr/sbin/', '/sbin/' ],
    require => File['/boot/firmware/cmdline.txt','/usr/share/backgrounds/wallpaper_pt.png'],
    subscribe => File['/boot/firmware/cmdline.txt','/usr/share/backgrounds/wallpaper_pt.png'],
    refreshonly => true,
  }
  
  file { '/etc/init.d/splash.sh':
    path    => '/etc/init.d/splash.sh',
    ensure  => file,
    source  => "puppet:///modules/${module_name}/splash.sh",
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }
  
  exec { 'update-rc.d splash.sh enable S':
    command => 'update-rc.d splash.sh enable S',
    path    => [ '/usr/sbin/', '/sbin/' ],
    require => File['/etc/init.d/splash.sh'],
    subscribe => File['/etc/init.d/splash.sh'],
    refreshonly => true,
  }
  
  service { 'splash.sh':
    name      => 'splash.sh',
    ensure    => running,
    enable    => true,
    hasstatus => true,
    hasrestart => true,
    subscribe => File['/etc/init.d/splash.sh'],
  }
  
}
