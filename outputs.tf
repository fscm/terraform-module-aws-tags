#
# Outputs for the resource's tags management module.
#
# Copyright 2016-2019, Frederico Martins
#   Author: Frederico Martins <http://github.com/fscm>
#
# SPDX-License-Identifier: MIT
#
# This program is free software. You can use it and/or modify it under the
# terms of the MIT License.
#

output "id" {
  description = "The ID of the resource."
  sensitive   = false
  value       = local._id_
}

output "id_tags_order" {
  description = "List of fields (in order) that were used for the resource id."
  sensitive   = false
  value       = var.id_tags_order
}

output "tags" {
  description = "A map with the tags."
  sensitive   = false
  value       = local._tags_
}

output "uuid" {
  description = "The UUID of the resource."
  sensitive   = false
  value       = local._uuid_
}

output "uuid_short" {
  description = "The prefix of the resource's UUID."
  sensitive   = false
  value       = local._uuid_short_
}
