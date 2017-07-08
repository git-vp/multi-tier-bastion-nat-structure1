variable "amis" { type = "map" }
variable "app_instance_type"   {}
variable "app_private_key" {}
variable "app_public_key" {}

module "app1" {
  source = "../../../modules/aws/compute"

  vpc_id = "${module.network.vpc_id}"
  ingress_sg_id = "${module.network.bastion_sg_id}"
  amis = "${var.amis}"
  region = "${var.region}"
  app_subnet_id = "${element(split(",", module.network.private_subnet_ids), 0)}"
  app_instance_type = "${var.app_instance_type}"
  bastion_host = "${module.network.bastion_public_ip}"
  bastion_private_key = "${var.bastion_private_key}"
  app_private_key = "${var.app_private_key}"
  app_public_key = "${var.app_public_key}"
}

output "app1_private_ip" { value="${module.app1.app_private_ip}"}
output "app1_private_dns" { value="${module.app1.app_private_dns}"}
#output "app1_sg_id" { value="${module.app1.app_sg_id}"}
