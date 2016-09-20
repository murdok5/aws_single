class aws_single {

  $pp_role = 'webserver'

  ec2_instance { 'webserver':
    ensure            => 'running',
    availability_zone => 'us-west-2',
    image_id          => 'ami-ca56b5aa',
    instance_type     => 't2.small',
    key_name          => 'mikesmith-TSE',
    region            => 'us-west-2',
    security_groups   => 'TSEDemoTest-Mike-TSEAWSDemoSG-V2DLT2VQBFLQ',
    subnet            => 'subnet-54fccc30',
    tags              => {
      'department'    => 'TSE',
      'project'       => 'TSE Demo',
      'created_by'    => 'mike.smith',
    },
    user_data         => template('aws_single/linux.erb'),
  }

}

include aws_single
