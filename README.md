# AWS WorkSpaces Terraform Configuration

This Terraform configuration sets up an AWS WorkSpace with a customized security group. It provides a streamlined way to provision virtual desktops in AWS.

## Prerequisites

- AWS Account with appropriate permissions
- [Terraform](https://www.terraform.io/downloads.html) installed (v1.0.0+)
- AWS Directory Service directory already set up
- VPC configured in your AWS account
- Source image "DDCloudWorkspace" configured in AWS WorkSpaces
  - This image will be associated with the WorkSpace bundle
  - All WorkSpaces created or rebuilt with this bundle will use this image
  - Ensure the image meets your organization's security and compliance requirements

## Quick Start

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd docker-cloud-on-workspaces-demo
   ```

2. Create a `terraform.tfvars` file with your specific values:
   ```hcl
   region        = "us-west-2"
   directory_id  = "d-xxxxxxxxxx"
   bundle_id     = "wsb-xxxxxxxxx"  # WorkSpace bundle ID
   user_name     = "username"
   vpc_id        = "vpc-xxxxxxxxx"
   workspace_name = "MyWorkSpace"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Preview the changes:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Configuration Options

### Required Variables
- `directory_id`: The ID of your AWS Directory Service directory
- `bundle_id`: The WorkSpace bundle ID to use
- `user_name`: Username for the WorkSpace
- `vpc_id`: VPC where the WorkSpace will be created

### Optional Variables
- `region`: AWS region (default: us-west-2)
- `workspace_name`: Name tag for the WorkSpace (default: DDCloudWorkspace)
- `compute_type`: Compute type (default: STANDARD)
- `user_volume_size`: Size of user volume in GiB (default: 50)
- `root_volume_size`: Size of root volume in GiB (default: 80)
- `running_mode`: WorkSpace running mode (default: AUTO_STOP)
- `auto_stop_timeout`: Auto-stop timeout in minutes (default: 60)

## Outputs

After successful application, you can retrieve:
- WorkSpace ID
- WorkSpace IP address
- WorkSpace computer name
- Security group ID

## Security Considerations

- By default, RDP access (port 3389) is allowed from all IPs (0.0.0.0/0)
- For production use, restrict `allowed_ip_ranges` to specific IP ranges
- Ensure proper IAM permissions are in place

## Cleanup

To destroy the created resources:
```bash
terraform destroy
```

## Support

For AWS WorkSpaces bundle IDs and other details, refer to:
- [AWS WorkSpaces Bundles](https://docs.aws.amazon.com/workspaces/latest/adminguide/amazon-workspaces-bundles.html)
- [AWS WorkSpaces Documentation](https://docs.aws.amazon.com/workspaces/)