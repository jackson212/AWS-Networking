# AWS-Networking

# AWS EC2 Terraform Project

## Project Overview

This project provides a Terraform configuration to launch AWS EC2 instances with both **public** and **private** subnets. It also sets up **NAT Gateway** and **Internet Gateway** for internet access. The project is designed to be fully compatible with the AWS **Free Tier** for certain AMIs and instance types like `t2.micro`.

Key features of this project:
- **VPC Setup**: Automatically creates a Virtual Private Cloud (VPC) with public and private subnets.
- **Security Groups**: Configures security groups to control access to EC2 instances.
- **NAT Gateway**: Provides internet access to instances in private subnets using a NAT Gateway.
- **Internet Gateway**: Provides internet access to instances in public subnets.

## Requirements

Before running this Terraform project, ensure that you have the following installed:
- [Terraform](https://www.terraform.io/downloads)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with your AWS credentials)

## Setup

### 1. Clone this repository:

```bash
git clone https://github.com/jackson212/AWS-Networking.git
cd aws-ec2-terraform
Ensure that your AWS credentials are set up correctly using either environment variables or AWS CLI:

bash
Copy code
aws configure


3. Initialize Terraform:

Run the following command to initialize the Terraform configuration:

terraform init

4. Plan the Terraform deployment:
Preview the changes that Terraform will make:

terraform plan

5. Apply the Terraform configuration:
Apply the configuration to create the necessary resources:


terraform apply

You will be prompted to confirm the apply operation. Type yes to proceed.

6. Verify the Infrastructure:
Once the deployment is complete, verify your EC2 instances and associated resources in the AWS Console.

Project Structure
main.tf: The main Terraform configuration file that defines the AWS resources like VPC, subnets, and security groups.
outputs.tf: Defines the output values (e.g., public IPs of EC2 instances).
variables.tf: Contains variables for configuration like subnet CIDRs, availability zones, etc.
README.md: This documentation file.
key_pair.tf: Defines the SSH key pair for EC2 instance access.

Security Considerations
Ensure that you are not exposing sensitive data (e.g., private keys or passwords) in your Terraform files.
Use security groups to restrict inbound and outbound traffic to your EC2 instances.
Store any sensitive variables securely using terraform.tfvars or AWS Secrets Manager.
Cleanup
To destroy the resources created by Terraform, run the following command:


terraform destroy
This will prompt you to confirm that you want to delete the resources created by this Terraform configuration.

License
This project is licensed under the MIT License - see the LICENSE file for details.

Notes:
This project is designed to be compatible with the AWS Free Tier for instance types such as t2.micro and t3.micro and uses Amazon Linux 2 or Ubuntu AMIs.
If you are using a custom AMI, ensure that the AMI ID is correct and compatible with your region.
markdown
Copy code

---

### Key Sections in the README:


 **Requirements**: Lists the tools you need (Terraform, AWS CLI, etc.) to run the project.
 **Setup**: Step-by-step instructions to clone the repo, configure AWS credentials, and run Terraform.
 **Project Structure**: Explains the files in the project.
 **Security Considerations**: Advises on best practices for handling sensitive data and security configurations.
 **Cleanup**: Instructions to clean up resources using `terraform destroy`.


#




