# must install registry module
# puppet module install puppetlabs-acl

$puppet_directory = 'C:/puppet-directory'
$puppet_user      = 'puppet-user'
$puppet_group     = 'puppet-group'


user { $puppet_user:
  ensure => present,
  groups => [$puppet_group],
}

group { $puppet_group:
  ensure => present,
}

file { $puppet_directory:
  ensure => 'directory',
  owner        => $puppet_user,
  group        => $puppet_group,
}

acl { $puppet_directory:
  purge        => true,
  permissions  => [{
    identity  => $puppet_user,
    rights    => ['full'],
    perm_type => 'allow',
  },
  {
    identity  => $puppet_group,
    rights    => ['read'],
    perm_type => 'allow',
  }],
}

File[$puppet_directory] -> Acl[$puppet_directory]
