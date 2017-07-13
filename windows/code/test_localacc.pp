$puppet_user      = 'puppet-user'
$puppet_group     = 'puppet-group'


user { $puppet_user:
  ensure => present,
  groups => [$puppet_group],
}

group { $puppet_group:
  ensure => present,
}