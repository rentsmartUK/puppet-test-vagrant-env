# must install dism and iis module
# puppet module install puppetlabs-dism
# puppet module install puppetlabs-iis

dism { 'IIS-WebServer':
  ensure    => present,
  all       => true,
}

iis::manage_app_pool { 'my_application_pool':
  enable_32_bit           => true,
  managed_runtime_version => 'v4.0',
}

iis::manage_site { 'www.mysite.com':
  site_path     => 'C:\inetpub\wwwroot\mysite',
  # site_id       => '10',
  port          => '80',
  ip_address    => '*',
  host_header   => 'www.mysite.com',
  app_pool      => 'my_application_pool'
}

iis::manage_virtual_application { 'application1':
  site_name   => 'www.mysite.com',
  site_path   => 'C:\inetpub\wwwroot\application1',
  app_pool    => 'my_application_pool'
}

file { 'C:\inetpub\wwwroot\application1\index.html':
  ensure  => file,
  content => "Hello world from ${::hostname}",
}

Dism['IIS-WebServer'] ->
Iis::Manage_app_pool['my_application_pool'] ->
Iis::Manage_site['www.mysite.com'] ->
Iis::Manage_virtual_application['application1'] ->
File['C:\inetpub\wwwroot\application1\index.html']
