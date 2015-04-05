class apache {
#  case $operatingsystem {
#    centos: {
#        $webserver= 'httpd'
#        $confpath = "/etc/$webserver/conf/$webserver.conf"
#    }
#    ubuntu: {
#        $webserver= 'apache2'
#        $confpath = "/etc/$webserver/$webserver.conf"
#    }
#  }
  $webserver= hiera('webserver')
  $confpath = hiera('confpath')
  $htmlpath = hiera('htmlpath') 

  package { 'apache':
	name   => $webserver,
	ensure => installed,
  }

  file {'apacheconf':
	name    => $confpath,
	ensure  => file,
	mode    => 600,
	source  => "puppet:///modules/apache/$webserver.conf",
	require => Package['apache'],
  }

  service {'apache':
	name      => $webserver,
	ensure    => running,
	enable    => true,
	subscribe => File['apacheconf'],
  }
  file {'apachecontent':
    name    => $htmlpath,
    ensure  => file,
    mode    => 644,
    content => template('apache/index.html.erb'),
    require => Service['apache'],
  }
}
