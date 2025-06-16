provider "aws" {
  region = var.region
}

# Create the WorkSpace
resource "aws_workspaces_workspace" "personal_workspace" {
  directory_id = var.directory_id
  bundle_id    = var.bundle_id  # Required - specifies the WorkSpace bundle to use
  user_name    = var.user_name

  workspace_properties {
    compute_type_name                         = var.compute_type
    user_volume_size_gib                      = var.user_volume_size
    root_volume_size_gib                      = var.root_volume_size
    running_mode                              = var.running_mode
    running_mode_auto_stop_timeout_in_minutes = var.auto_stop_timeout
  }

  tags = {
    Name = var.workspace_name
  }
}

# Create a security group for the WorkSpace
resource "aws_security_group" "workspace_sg" {
  name        = "${var.workspace_name}-sg"
  description = "Security group for ${var.workspace_name} WorkSpace"
  vpc_id      = var.vpc_id

  # Allow RDP traffic
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_ranges
    description = "Allow RDP access"
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.workspace_name}-sg"
  }
}
