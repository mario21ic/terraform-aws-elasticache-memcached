variable "region" {
  description = "aws region"
  #default     = "ca-central-1"
}

variable "name" {
  description = "elasticache name"
}

variable "env" {
  description = "environment name"
}

variable "node_type" {
  description = "Node type"
}

variable "engine" {
  description = "engine"
  default = "memcached"
}

variable "num_cache_nodes" {
  description = "node number"
}

variable "port" {
  description = "node port"
}

variable "parameter_family" {
  description = "Parameter family name"
}

variable "parameters" {
  type = "map"
  default = {
    name  = "max_item_size"
    value = 52428800
  }
  description = "map of parameters"
}

variable "subnet_ids" {
  type        = "list"
  description = "Subnet ids"
}

variable "security_group_ids" {
  type        = "list"
  description = "Security groups id"
}

//variable "security_group_access" {
//  type = "list"
//  description = "security group id to allow access"
//}
//# vpc variables
//variable "vpc_id" {
//  description = "vpc id"
//}
//variable "subnet_1_id" {
//  description = "Subnet id"
//}
//variable "subnet_2_id" {
//  description = "Subnet id"
//}
