# test our server setup Nginx
exec { 'changelimit':
  command => 'sed -i -e "s/15/1000/g" /etc/default/nginx',
  path    => '/bin/',
}

service { 'nginx':
  ensure    => running,
  subscribe => Exec['changelimit'],
}