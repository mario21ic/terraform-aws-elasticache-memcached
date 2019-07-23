resource "aws_elasticache_cluster" "ec" {
  cluster_id           = "${var.env}-ec-${var.name}"
  engine               = "${var.engine}"
  node_type            = "${var.node_type}"
  port                 = "${var.port}"
  num_cache_nodes      = "${var.num_cache_nodes}"

  subnet_group_name    = "${aws_elasticache_subnet_group.sn_group.name}"
  security_group_ids   = ["${var.security_group_ids}"]
  parameter_group_name = "${aws_elasticache_parameter_group.my_pg.name}"

  tags {
    Name        = "${var.env}-ec-${var.name}"
    Env         = "${var.env}"
    Description = "Elasticache for ${var.env} - ${var.name}"
  }
}

resource "aws_elasticache_parameter_group" "my_pg" {
  name    = "${var.env}-pg-${var.name}"
  family  = "${var.parameter_family}"

  parameter {
    name  = "${var.parameters["name"]}"
    value = "${var.parameters["value"]}"
  }
}

resource "aws_elasticache_subnet_group" "sn_group" {
  name = "${var.env}-sn-${var.name}"
  subnet_ids = ["${var.subnet_ids}"]
  description = "Allow subnets availability to elasticache"
}

//resource "aws_security_group" "sg_ec" {
//  name        = "${var.env}-sg-ec-${var.name}"
//  description = "Allow request to ec ${var.env} - ${var.name}"
//  vpc_id      = "${var.vpc_id}"
//
//  ingress {
//    from_port   = "${var.port}"
//    to_port     = "${var.port}"
//    protocol    = "tcp"
//    security_groups = ["${var.security_group_access}"]
//  }
//
//  #egress {
//  #  from_port   = 0
//  #  to_port     = 0
//  #  protocol    = "-1"
//  #  cidr_blocks = ["0.0.0.0/0"]
//  #}
//
//  tags {
//    Name        = "${var.env}-sg-ec-${var.name}"
//    Env         = "${var.env}"
//    Description = "security group ${var.env}"
//  }
//}
