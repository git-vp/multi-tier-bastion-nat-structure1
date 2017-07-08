variable "public_subnets"  {}
variable "private_subnets" {}
variable "name"            {}
variable "vpc_cidr"        {}
variable "azs"             {}
#variable "region"          {}
variable "bastion_public_key"        {}
variable "bastion_private_key"        {}
variable "bastion_instance_type" {}


module "network" {
  source = "../../../modules/aws/network"
  
  name = "${var.name}"
  vpc_cidr = "${var.vpc_cidr}"
  
  public_subnets = "${var.public_subnets}"
  azs = "${var.azs}"
  
  private_subnets = "${var.private_subnets}"

  region = "${var.region}"
  bastion_public_key = "${var.bastion_public_key}"
  bastion_private_key = "${var.bastion_private_key}"
  bastion_instance_type = "${var.bastion_instance_type}"
}

output "bastion_public_ip"  { value = "${module.network.bastion_public_ip}" }



