class apache::params {
  case $::operatingsystem {
    'CentOS': {
        $webserver= 'httpd'
        $confpath = "/etc/$webserver/conf/$webserver.conf"
        $htmlpath = '/var/www/html/index.html'
    }
    'Ubuntu': {
        $webserver= 'apache2'
        $confpath = "/etc/$webserver/$webserver.conf"
        $htmlpath = '/var/www/index.html'
    }
    default: {
        fail("The ${module_name} does not support this Operating System")
    }
  }
} 
