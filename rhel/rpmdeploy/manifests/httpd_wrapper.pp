# Class: rpmdeploy::httpd_wrapper
#
# This class is a wrapper for rpmdeploy module 
#
class rpmdeploy::httpd_wrapper (
  $package = 'httpd',
  $version = 'installed',
  $service = 'httpd',
  $hasstatus = true,
) inherits ::rpmdeploy {

  #class { '::rpmdeploy':
  #  package => $package,
  #  version => $version,
  #  service => $service,
  #  hasstatus => $hasstatus,
  #}
}
