node 'node1' {
  class { 'apache': }             # use apache module
  apache::vhost { 'www.example.com':  # define vhost resource
    port    => '80',
    docroot => '/var/www/html'
  }
}
node 'lamp-1' {
  class { 'apache': }             # use apache module
  apache::vhost { 'www.example.com':  # define vhost resource
    port    => '80',
    docroot => '/var/www/html'
  }
}

# node default {}       # uncomment this line if it doesn't already exist in your manifest