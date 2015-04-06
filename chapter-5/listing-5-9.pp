class php {
  $webserver = hiera('webserver')
  package { 'php':
    name => hiera('phpserver'),
    ensure => installed,
  }
  package { 'phpmysql':
    name => hiera('phpmysql'),
    ensure => installed,
    require => Package['php'],
  }
  file { 'phpsample':
    name => hiera('phppath'),
    ensure => file,
    mode => 644,
    source => 'puppet:///modules/php/index.php',
    require => Package['phpmysql'],
  }
}
