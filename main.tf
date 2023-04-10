module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "single-instance-1"
  count = var.number_of_instance
  ami                    = var.ami_id
  instance_type          = var.instance_type["${var.type}"]
  key_name               = var.keyname
  vpc_security_group_ids = ["${var.sg_id}"]
  subnet_id              = var.subnetid

  tags = {
    Team = "Infra"
  }
}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = <<EOT
      sleep 100
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos -i public_ips.txt --private-key Krishna.pem playbook.yaml
    EOT
  }
  depends_on = [resource.local_file.ip]
}

resource "local_file" "ip" {
    content  = join("\n", module.ec2_instance[*].private_ip)
    filename = "public_ips.txt"
    depends_on = [module.ec2_instance]
}
