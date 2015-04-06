
package { 'apache':
    	name   => 'httpd',
		ensure => installed,
		before => File['apacheconf'],
}
file {'apacheconf':
		name   => '/etc/httpd/conf/httpd.conf', 
		ensure => file,
		mode   => 600,
		source => '/etc/puppet/files/httpd.conf', 
		notify => Service['apache'],
}
service {'apache':
       name      => 'httpd',
       ensure    => running,
       enable    => true,
}