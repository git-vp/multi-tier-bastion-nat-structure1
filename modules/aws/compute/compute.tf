variable "vpc_id"              {}
variable "ingress_sg_id"       {}
variable "amis"                { type = "map" }
variable "region"              {}
variable "app_subnet_id"       {}
variable "app_instance_type"   {}
variable "bastion_host"        {}
variable "bastion_private_key" {}
variable "app_private_key"     {}
variable "app_public_key"      {}

module "app" {
  source = "./app"

  vpc_id = "${var.vpc_id}"
  ingress_sg_id = "${var.ingress_sg_id}"
  amis = "${var.amis}"
  region = "${var.region}"
  app_subnet_id = "${var.app_subnet_id}"
  app_instance_type = "${var.app_instance_type}"
  bastion_host = "${var.bastion_host}"
  bastion_private_key = "${var.bastion_private_key}"
  app_private_key = "${var.app_private_key}"
  app_public_key = "${var.app_public_key}"
}

output "app_private_ip" { value = "${module.app.private_ip}" }
output "app_private_dns" { value = "${module.app.private_dns}" }
output "app_sg_id" { value = "${module.app.sg_id}"}