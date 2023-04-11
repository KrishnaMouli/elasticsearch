module "master_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "ES-MasterNode"
  count = var.number_of_master_instance
  ami                    = var.ami_id
  instance_type          = var.master_instance_type
  key_name               = var.keyname
  vpc_security_group_ids = ["${var.sg_id}"]
  subnet_id              = var.subnetid

  tags = {
    Team = "Infra"
  }
}

resource "null_resource" "es_master" {
  provisioner "local-exec" {
    command = <<EOT
      sleep 100
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos -i private_ips.txt --private-key Krishna.pem playbook.yaml
    EOT
  }
  depends_on = [resource.local_file.master_ip]
}

resource "local_file" "master_ip" {
    content  = join("\n", module.master_instance[*].private_ip)
    filename = "private_ips.txt"
    depends_on = [module.master_instance]
}
