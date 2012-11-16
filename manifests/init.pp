# Class: gdash
#
# This module manages gdash
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class gdash (
  $graphitehost='127.0.0.1',
  $gdashroot = '/usr/local/gdash/'
)
{

  # I`m expecting the package to install it's content in /usr/local/gdash


  file{"${gdashroot}":
    ensure => directory;
  }

  #package {
  #  'rubygem-sinatra':
  #    ensure  => '1.3.3-1',
  #    require => Package['rubygem-rack']
  #}
  package {
    'rubygem-bundler':
      ensure => present
  }
  #package {
  #  'rubygem-tilt':
  #    ensure => present
  #}
  #  package {
  #  'rubygem-rack':
  #    ensure => '1.3.4-1'
  #}
  #package {
  #  'rubygem-rack-protection':
  #    ensure  => present,
  #    require => Package['rubygem-rack']
  #}




  package { 'gdash': ensure => present }
  package { 'gdash-bundled-deps':
    ensure => '0.98.14-1',
  }


  file {
    "${gdashroot}/config/gdash.yaml":
      content => template('gdash/gdash.yaml.erb'),
      group   => '0',
      owner   => '0',
      require => Package['gdash'],
  }


}

