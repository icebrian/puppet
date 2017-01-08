class chocolatey::wmf {
	package { 'powershell': 
		ensure => latest, 
		provider => 'chocolatey', 
		install_options => ['-pre'], 
	}
}