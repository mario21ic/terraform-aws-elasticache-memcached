region = "ca-central-1"
env = "draft"
name = "session"
engine = "memcached"
node_type = "cache.t2.micro"
port = 11211
num_cache_nodes = 1
parameter_family = "memcached1.4"

parameters = {
  name  = "max_item_size"
  value = 52428800
}

//subnet_1_id = "subnet-aa978fce"
//subnet_2_id = "subnet-edabb39b"
//
//security_group_bastion = "sg-ae1bbfc7"
//security_group_access = "sg-ae1bbfc7"
