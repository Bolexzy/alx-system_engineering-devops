# Using Puppet,  install and configure an Nginx server
#Nginx should be listening on port 80
#When querying Nginx at its root / with a GET request (requesting a page)
#   using curl, it must return a page that contains the string Hello World!
#The redirection must be a “301 Moved Permanently”

package { 'nginx':
    ensure   => 'present',
}

exec {'install':
    command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx',
    provider => shell,
}

exec {'html':
    provider => shell,
    command => 'echo "Hello World!" | sudo tee /var/www/html/index.html',
}

exec {'redirect':
    command => 'sed -i "s|server_name _;|${new_string}|" /etc/nginx/sites-available/default',
}

exec {'run':
  command  => 'sudo service nginx restart',
  provider => shell,
}
