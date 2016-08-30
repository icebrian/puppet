# Class: rpmdeploy::sshd_wrapper
#
# This class is a wrapper for rpmdeploy module 
#
class rpmdeploy::sshd_wrapper (
  $package = 'openssh',
  $version = 'installed',
  $service = 'sshd',
  $hasstatus = true,
) inherits ::rpmdeploy {

  #class { '::rpmdeploy':
  #  package => $package,
  #  version => $version,
  #  service => $service,
  #  hasstatus => $hasstatus,
  #}
}
