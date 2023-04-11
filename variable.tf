variable "ami_id" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-0678c0fbe977af909"
}

variable "master_instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.medium"
}

variable "data_instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.medium"
}

variable "keyname" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource"
  type        = string
  default     = "Krishna"
}

variable "sg_id" {
  description = "A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC"
  type        = string
  default     = "sg-0e2453f00c8ea6631"
}

variable "subnetid" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = "subnet-071fa3a4ab69bbb46"
}

variable "number_of_master_instance" {
  description = "The Number of instaces to launch"
  type        = number
  default     = 1
}

variable "number_of_data_instance" {
  description = "The Number of instaces to launch"
  type        = number
  default     = 1
}
