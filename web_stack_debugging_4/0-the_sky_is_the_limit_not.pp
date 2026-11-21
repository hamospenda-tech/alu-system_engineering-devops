# Raises the Nginx open-file limit so it can handle many concurrent requests without failing

exec { 'fix--for-nginx':
  command => 'sed -i "s/^ULIMIT=.*/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/:/usr/bin/',
}

-> exec { 'restart-nginx':
  command => 'service nginx restart',
  path    => '/usr/sbin/:/usr/bin/:/sbin/:/bin/',
}
