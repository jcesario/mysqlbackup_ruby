yumrepo { "percona":
  baseurl => "http://repo.percona.com/centos/6/os/$architecture/",
  descr => "The percona repository",
  enabled => "1",
  gpgcheck => "0",
}

yumrepo { "epel":
  descr => "The epel repository",
  enabled => "1",
  gpgcheck => "0",
  mirrorlist => "https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$architecture"
}

package { "Percona-Server-server-55":
  ensure => installed,
  require => Yumrepo["percona"]
} 

package { "percona-xtrabackup":
  ensure => installed,
  require => Yumrepo["percona"]
}

package { "percona-toolkit":
  ensure => installed,
  require => Yumrepo["percona"]
}

package { "sysbench":
  ensure => installed,
  require => Yumrepo['epel']
}

package { "man":
  ensure => installed,
} 

service { "mysql":
  enable => true,
  ensure => running,
  #hasrestart => true,
  #hasstatus => true,
  require => Package["Percona-Server-server-55"]
}
