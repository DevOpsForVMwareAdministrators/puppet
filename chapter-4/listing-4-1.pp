
package { 'apache':
       name   => 'httpd',
       ensure => installed,
}
file {'apacheconf':
		name    => '/etc/httpd/conf/httpd.conf',
		ensure  => file,
		mode    => 600,
		source  => '/etc/puppet/files/httpd.conf',
		require => Package['apache'],
}

service {'apache':
       	name      => 'httpd',
		ensure    => running,
		enable    => true,
		subscribe => File['apacheconf'],
}
