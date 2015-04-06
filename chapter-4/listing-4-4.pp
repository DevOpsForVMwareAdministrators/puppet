case $operatingsystem {
  centos: {
      $webserver= 'httpd'
      $confpath = "/etc/$webserver/conf/$webserver.conf"
  }
  ubuntu: {
      $webserver= 'apache2'
      $confpath = "/etc/$webserver/$webserver.conf"
}
default: {
      fail("Unsupported OS")
  }
}

package { 'apache':
       name   => $webserver,
       ensure => installed,
}
file {'apacheconf':
       name    => $confpath,
       ensure  => file,
       mode    => 600,
       source  => "/etc/puppet/files/$webserver.conf",
       require => Package['apache'],
}
service {'apache':
          name   => $webserver,
          ensure   => running,
          enable   => true,
          subscribe => File['apacheconf'],
}