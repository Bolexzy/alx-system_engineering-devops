# Use Puppet to automate the task of creating a custom HTTP header response.

package { 'nginx':
    ensure   => 'installed',
    provider => 'apt',
}

file_line { 'http header':
    path  => '/etc/nginx/nginx.conf',
    match => 'server_name _;',
    line  => 'server_name _;\n\n\tadd_header X-Served-By \$HOSTNAME;',
}

exec { 'run':
  command => '/usr/sbin/service nginx restart',
}
