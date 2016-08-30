# Class: httpdconf::webservers_wrapper
#
# This class is a wrapper for httpdconf module 
#
class httpdconf::webservers_wrapper (
  $conf_file = 'httpd.conf.webservers',
  $version = 'installed',
  $ambiente = $::ambiente,
) inherits ::httpdconf {

}
