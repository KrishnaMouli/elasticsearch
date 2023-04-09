variable "ami_id" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = ""
}

variable "instance_type" {
  type = map
  default = {
    "master"  = "t2.medium"
    "slave" = "t2.micro"
  }
}

variable "type" {
  description = "The type of instance to start"
  type        = string
  default     = "master"
}

variable "keyname" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
  type        = string
  default     = ""
}

variable "sg_id" {
  description = "A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC"
  type        = string
  default     = ""
}

variable "subnetid" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}

variable "number_of_instance" {
  description = "The Number of instaces to launch"
  type        = number
  default     = 2
}
