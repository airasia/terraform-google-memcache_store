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

output "discovery_dns" {
  description = "Private DNS address of the endpoint for Discovery API of the memcache instance."
  value       = local.create_private_dns ? trimsuffix(google_dns_record_set.memcache_subdomain.0.name, ".") : null
}

output "discovery_port" {
  description = "The port number of the endpoint for Discovery API of the memcache instance."
  value = local.discovery_port
}

output "node_ips" {
  description = "The IP addresses of all nodes in the memcache instance."
  value = google_memcache_instance.memcache_store.memcache_nodes.*.host
}

output "node_ports" {
  description = "The port numbers of all nodes in the memcache instance."
  value = google_memcache_instance.memcache_store.memcache_nodes.*.port
}

output "node_zones" {
  description = "The zones of all nodes in the memcache instance."
  value = google_memcache_instance.memcache_store.memcache_nodes.*.zone
}
