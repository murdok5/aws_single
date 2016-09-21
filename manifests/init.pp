class aws_single {

  $pp_role = 'webserver'
  $pe_master_hostname = $::ec2_metadata['hostname']
..
  ec2_instance { 'webserver':
    ensure            => 'running',
    availability_zone =>  $::ec2_metadata['placement']['availability-zone'],
    image_id          => 'ami-ca56b5aa',
    instance_type     => 't2.small',
    key_name          => 'mikesmith-TSE',
    region            => $::ec2_region,
    security_groups   => $::ec2_metadata['security-groups'],
    subnet            => $::ec2_metadata['network']['interfaces']['macs']["$::macaddress"]['subnet-id'],
    tags              => {
      'department'    => 'TSE',
      'project'       => 'TSE Demo',
      'created_by'    => 'mike.smith',
    },
    user_data         => template('aws_single/linux.erb'),
  }

}

include aws_single
