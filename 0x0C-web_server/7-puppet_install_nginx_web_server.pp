# configue server Nginx 35.190.136.16 with puppet

package { 'nginx':
  ensure   => 'latest',
  name     => 'nginx',
  provider => 'apt'
}

file { 'index':
  path    => '/var/www/html/index.html',
  content => 'Holberton School'
}

file_line { '301 Moved Permanently':
  path  => '/etc/nginx/sites-available/default',
  line  => '\trewrite ^/redirect_me https://twitter.com/Arquimedescq permanent;',
  after => '^server {'
}

service { 'nginx':
  ensure => running,
  enable => true
}