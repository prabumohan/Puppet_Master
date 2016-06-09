file {'/tmp/example-ip':                                            # resource type file and filename
  ensure  => present,                                               # make sure it exists
  mode    => '0644',                                                # file permissions
  content => "Ruby version ${Prabu}.\n",  # note the ipaddress_eth0 fact
  content => "Ruby version ${Prabu}.\n",  # note the ipaddress_eth0 fact
}
