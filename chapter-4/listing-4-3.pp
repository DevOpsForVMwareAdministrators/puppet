package { 'apache':
       name   => 'httpd',
       ensure => installed,
}
->
file {'apacheconf':
       name    => '/etc/httpd/conf/httpd.conf',
       ensure  => file,
       mode    => 600,
       source  => '/etc/puppet/files/httpd.conf',
}
~>
service {'apache':
       name    => 'httpd',
       ensure  => running,
       enable  => true,
}
