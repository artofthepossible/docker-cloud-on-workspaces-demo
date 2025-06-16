output "workspace_id" {
  description = "The ID of the WorkSpace"
  value       = aws_workspaces_workspace.personal_workspace.id
}

output "workspace_ip_address" {
  description = "The IP address of the WorkSpace"
  value       = aws_workspaces_workspace.personal_workspace.ip_address
}

output "workspace_computer_name" {
  description = "The computer name of the WorkSpace"
  value       = aws_workspaces_workspace.personal_workspace.computer_name
}

output "security_group_id" {
  description = "The ID of the security group created for the WorkSpace"
  value       = aws_security_group.workspace_sg.id
}
