variable "name" {
  default     = "Default"
  type        = string
  description = "VPC"
}

variable "project" {
  type        = string
  description = "AWS Networking Project"
}



variable "region" {
  default     = "ca-central-1"
  type        = string
  description = "Region of the VPC"
}

variable "cidr_block" {
  default     = "12.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {

  default     = ["12.0.0.0/24", "12.0.1.0/24"]
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}
  
variable "private_subnet_cidr_blocks" {

    default = ["12.0.2.0/24","12.0.3.0/24"]
    type =list(any)
    description = "List of  CIDR block for private subnet"
  
}

variable "availability_zone" {
  
  default = ["ca-central-1a", "ca-central-1b" ,"ca-central-1c"]

}