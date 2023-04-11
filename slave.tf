module "data_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "ES-DataNode"
  count = var.number_of_data_instance
  ami                    = var.ami_id
  instance_type          = var.data_instance_type
  key_name               = var.keyname
  vpc_security_group_ids = ["${var.sg_id}"]
  subnet_id              = var.subnetid

  tags = {
    Team = "Infra"
  }
}

resource "null_resource" "es_data" {
  provisioner "local-exec" {
    command = <<EOT
      sleep 100
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u centos -i public_ips.txt --private-key Krishna.pem playbook.yaml
    EOT
  }
  depends_on = [resource.local_file.data_ip]
}

resource "local_file" "data_ip" {
    content  = join("\n", module.data_instance[*].private_ip)
    filename = "public_ips.txt"
    depends_on = [module.data_instance]
}
