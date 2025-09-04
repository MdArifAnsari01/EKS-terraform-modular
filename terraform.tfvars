
vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = [
  "10.0.0.0/18",
  "10.0.64.0/18"
]

private_subnet_cidr = [
  "10.0.128.0/18",
  "10.0.192.0/18"
]

region = "us-east-1"

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

eks_cluster_name = "my-eks-cluster"

cluster_version = "1.33"

node_groups = {
  my-node-group = {
    instance_types = ["t3.medium"]
    capacity_type  = "ON_DEMAND"

    scaling_config = {
      desired_size = 2
      min_size     = 1
      max_size     = 3
    }
  }
}
