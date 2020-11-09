# ----------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name_suffix" {
  description = "An arbitrary suffix that will be added to the end of the resource name(s). For example: an environment name, a business-case name, a numeric id, etc."
  type        = string
  validation {
    condition     = length(var.name_suffix) <= 14
    error_message = "A max of 14 character(s) are allowed."
  }
}

variable "vpc_network_id" {
  description = "The identifier of the VPC network to host the Memcache MemoryStore in. The expected format is projects/{{project}}/global/networks/{{name}}."
  type        = string
}

# ----------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ----------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "An arbitrary name for the Memcache instance."
  type        = string
  default     = "v1"
}

variable "zone_letters" {
  description = "Accepts a list of one or more zone-letters from among \"a\", \"b\", \"c\" or \"d\" to decide between single-zone vs multi-zonal Memcache instance."
  type        = list(string)
  default     = ["a"]
}

variable "node_count" {
  description = "Total number of memcache nodes to be provisioned. These nodes will be distributed among the zones selected in \"var.zone_letters\"."
  type        = number
  default     = 1
}

variable "cpu_per_node" {
  description = "Number of CPU to be provisioned per node."
  type        = number
  default     = 1
}

variable "memory_gb_per_node" {
  description = "Memory size in GB to be provisioned per node."
  type        = number
  default     = 1
}

variable "memcache_version" {
  description = "The version of Memcache software. See https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memcache_instance#memcache_version."
  type        = string
  default     = "MEMCACHE_1_5"
}

variable "memcache_timeout" {
  description = "how long a memcache operation is allowed to take before being considered a failure."
  type        = string
  default     = "20m"
}
