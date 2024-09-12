provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami   
  instance_type = var.instance_type

  key_name = var.key_name

  # Tags para identificar la instancia
  tags = {
    Name = var.instance_name
  }
  #EBS block with encrypted disk
  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = 10
    volume_type = "gp2"
    encrypted = true
  }

  # Bloque opcional de configuración del EBS
  dynamic "ebs_block_device" {
    
    for_each = var.ebs_block_devices
    content {
      device_name           = ebs_block_device.value.device_name
      volume_size           = ebs_block_device.value.volume_size
      delete_on_termination = ebs_block_device.value.delete_on_termination
      volume_type           = ebs_block_device.value.volume_type
    }
  }

  # Conexión a través de un security group
  vpc_security_group_ids = [var.security_group_id]
  
  # Subnet donde se lanza la instancia
  subnet_id = var.subnet_id


}
