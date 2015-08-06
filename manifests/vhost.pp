class gdash::vhost {

  file {
    '/etc/httpd/conf.d/gdash.conf':
      ensure  => 'file',
      group   => '0',
      mode    => '0644',
      owner   => '0',
      source => 'puppet:///modules/gdash/gdash.conf',
      notify => Service['httpd'];
  }
}
