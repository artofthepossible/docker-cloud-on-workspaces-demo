variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-west-2"
  type        = string
}

variable "directory_id" {
  description = "The ID of the AWS Directory Service directory"
  type        = string
}

variable "user_name" {
  description = "The username of the user for the WorkSpace"
  type        = string
}

variable "workspace_name" {
  description = "The name of the WorkSpace"
  default     = "DDCloudWorkspace"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "allowed_ip_ranges" {
  description = "List of CIDR blocks allowed to connect to the WorkSpace via RDP"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Note: For production, restrict this to specific IP ranges
}

variable "compute_type" {
  description = "The compute type for the WorkSpace"
  type        = string
  default     = "STANDARD"
}

variable "user_volume_size" {
  description = "The size of the user volume in GiB"
  type        = number
  default     = 50
}

variable "root_volume_size" {
  description = "The size of the root volume in GiB"
  type        = number
  default     = 80
}

variable "running_mode" {
  description = "The running mode of the WorkSpace"
  type        = string
  default     = "AUTO_STOP"
}

variable "auto_stop_timeout" {
  description = "The time in minutes before the WorkSpace auto-stops"
  type        = number
  default     = 60
}

variable "bundle_id" {
  type        = string
  description = "The ID of the WorkSpace bundle to use"
}
