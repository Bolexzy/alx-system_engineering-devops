# Using Puppet,  install and configure an Nginx server
#Nginx should be listening on port 80
#When querying Nginx at its root / with a GET request (requesting a page)
#   using curl, it must return a page that contains the string Hello World!
#The redirection must be a “301 Moved Permanently”

package { 'nginx':
    ensure   => 'present',
    provider => 'apt',
}

exec { 'install':
    command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx',
    provider => shell,
}

file { '/var/www/html/index.html':
    ensure  => file,
    content => 'Hello World!',
}

file_line { 'redirect /redirect_me':
    ensure => present,
    path   => '/etc/nginx/sites-available/default',
    match  => 'server_name _;',
    line   => 'server_name _;\n\n\tlocation /redirect_me {\n\t\treturn 301 https://bolexzy.hashnode.dev/;\n\t}\n',
}

exec {'run':
    command  => 'sudo service nginx restart',
    provider => shell,
}
