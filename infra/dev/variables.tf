variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1" 
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "key_name" {
  description = "AWS Key Pair name for SSH access"
  type        = string
  default     = "my-aws-key" 
}

variable "k8s_token" {
  description = "Token for kubeadm join"
  type        = string
  default     = "abcdef.0123456789abcdef" 
}
