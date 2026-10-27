output "service_levels_id" {
  description = "Map of id values across all service_levels, keyed the same as var.service_levels"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.id }
}
output "service_levels_description" {
  description = "Map of description values across all service_levels, keyed the same as var.service_levels"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.description }
}
output "service_levels_events" {
  description = "Map of events values across all service_levels, keyed the same as var.service_levels"
  value       = { for k, v in newrelic_service_level.service_levels : k => one(v.events) }
}
output "service_levels_guid" {
  description = "Map of guid values across all service_levels, keyed the same as var.service_levels"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.guid }
}
output "service_levels_name" {
  description = "Map of name values across all service_levels, keyed the same as var.service_levels"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.name }
}
output "service_levels_objective" {
  description = "Map of objective values across all service_levels, keyed the same as var.service_levels"
  value       = { for k, v in newrelic_service_level.service_levels : k => one(v.objective) }
}
output "service_levels_sli_guid" {
  description = "Map of sli_guid values across all service_levels, keyed the same as var.service_levels"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.sli_guid }
}
output "service_levels_sli_id" {
  description = "Map of sli_id values across all service_levels, keyed the same as var.service_levels"
  value       = { for k, v in newrelic_service_level.service_levels : k => v.sli_id }
}

