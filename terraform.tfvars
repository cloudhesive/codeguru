region            = "us-east-1"
ami               = "ami-0c55b159cbfafe1f0" # Ejemplo de AMI
instance_type     = "t2.micro"
key_name          = "mi_clave_ssh"
instance_name     = "mi_instancia_ec2"
security_group_id = "sg-12345678"
subnet_id         = "subnet-12345678"

ebs_block_devices = [
  {
    device_name           = "/dev/xvda"
    volume_size           = 8
    delete_on_termination = true
    volume_type           = "gp2"
  }
]
