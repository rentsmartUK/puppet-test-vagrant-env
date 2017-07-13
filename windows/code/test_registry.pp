# must install registry module
# puppet module install puppetlabs-registry

$key_path_ie       = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}'
$key_path_shutdown = 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability'

registry_key { $key_path_ie:
  ensure => present,
}

registry_key { $key_path_shutdown:
  ensure => present,
}

registry_value { "${key_path_ie}\\IsInstalled":
  ensure => present,
  type   => dword,
  data   => 1,
}

registry_value { "${key_path_shutdown}\\ShutdownReasonUI":
  ensure => present,
  type   => dword,
  data   => 1,
}

registry_value { "${key_path_shutdown}\\ShutdownReasonOn":
  ensure => present,
  type   => dword,
  data   => 1,
}
