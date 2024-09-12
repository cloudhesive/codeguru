variable "region" {
  description = "La región de AWS donde se lanzará la instancia"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "ID de la imagen AMI que usará la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de la instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Nombre de la clave SSH"
  type        = string
}

variable "instance_name" {
  description = "Nombre de la instancia para las etiquetas"
  type        = string
  default     = "mi_instancia_ec2"
}

variable "security_group_id" {
  description = "ID del Security Group que se usará para la instancia"
  type        = string
}

variable "subnet_id" {
  description = "ID de la Subnet en la que se lanzará la instancia"
  type        = string
}

variable "ebs_block_devices" {
  description = "Configuración de los dispositivos EBS"
  type = list(object({
    device_name           = string
    volume_size           = number
    delete_on_termination = bool
    volume_type           = string
  }))
  default = []
}
