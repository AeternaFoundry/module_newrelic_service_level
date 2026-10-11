output "service_levels_id" {
  description = "Map of id values across all service_levels, keyed the same as var.service_levels except keys with no id are omitted"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.id if v.id != null && length(v.id) > 0 }
}
output "service_levels_description" {
  description = "Map of description values across all service_levels, keyed the same as var.service_levels except keys with no description are omitted"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.description if v.description != null && length(v.description) > 0 }
}
output "service_levels_events" {
  description = "Map of events values across all service_levels, keyed the same as var.service_levels except keys with no events are omitted"
  value       = { for k, v in newrelic_service_level.service_levels : k => one(v.events) if v.events != null && length(v.events) > 0 }
}
output "service_levels_guid" {
  description = "Map of guid values across all service_levels, keyed the same as var.service_levels except keys with no guid are omitted"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.guid if v.guid != null && length(v.guid) > 0 }
}
output "service_levels_name" {
  description = "Map of name values across all service_levels, keyed the same as var.service_levels except keys with no name are omitted"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.name if v.name != null && length(v.name) > 0 }
}
output "service_levels_objective" {
  description = "Map of objective values across all service_levels, keyed the same as var.service_levels except keys with no objective are omitted"
  value       = { for k, v in newrelic_service_level.service_levels : k => one(v.objective) if v.objective != null && length(v.objective) > 0 }
}
output "service_levels_sli_guid" {
  description = "Map of sli_guid values across all service_levels, keyed the same as var.service_levels except keys with no sli_guid are omitted"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.sli_guid if v.sli_guid != null && length(v.sli_guid) > 0 }
}
output "service_levels_sli_id" {
  description = "Map of sli_id values across all service_levels, keyed the same as var.service_levels except keys with no sli_id are omitted"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.sli_id if v.sli_id != null && length(v.sli_id) > 0 }
}

