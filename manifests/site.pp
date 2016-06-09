file {'/tmp/example-ip':                                            # resource type file and filename
  ensure  => present,                                               # make sure it exists
  mode    => '0644',                                                # file permissions
  content => "Ruby version ${serialnumber}.\n",  # note the ipaddress_eth0 fact
  content => "Ruby version ${puppetversion}.\n",  # note the ipaddress_eth0 fact
}
