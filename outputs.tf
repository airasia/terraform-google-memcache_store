output "usage_IAM_roles" {
  description = "Basic IAM role(s) that are generally necessary for using the resources in this module. See https://cloud.google.com/iam/docs/understanding-roles."
  value = [
    "roles/memcache.viewer",
  ]
}

output "discovery_ip" {
  description = "The IP address of the endpoint for Discovery API of the memcache instance."
  value = local.discovery_ip
}

output "discovery_port" {
  description = "The port number of the endpoint for Discovery API of the memcache instance."
  value = local.discovery_port
}
