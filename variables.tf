variable "service_levels" {
  description = <<EOT
Map of service_levels, attributes below
Required:
    - guid
    - name
    - events (block):
        - account_id (required)
        - bad_events (optional, block):
            - from (required)
            - select (optional, block):
                - attribute (optional)
                - function (required)
                - threshold (optional)
            - where (optional)
        - good_events (optional, block):
            - from (required)
            - select (optional, block):
                - attribute (optional)
                - function (required)
                - threshold (optional)
            - where (optional)
        - valid_events (required, block):
            - from (required)
            - select (optional, block):
                - attribute (optional)
                - function (required)
                - threshold (optional)
            - where (optional)
    - objective (block):
        - description (optional)
        - name (optional)
        - target (required)
        - time_window (required, block):
            - rolling (required, block):
                - count (required)
                - unit (required)
Optional:
    - description
EOT

  type = map(object({
    guid        = string
    name        = string
    description = optional(string)
    events = object({
      account_id = number
      bad_events = optional(object({
        from = string
        select = optional(object({
          attribute = optional(string)
          function  = string
          threshold = optional(number)
        }))
        where = optional(string)
      }))
      good_events = optional(object({
        from = string
        select = optional(object({
          attribute = optional(string)
          function  = string
          threshold = optional(number)
        }))
        where = optional(string)
      }))
      valid_events = object({
        from = string
        select = optional(object({
          attribute = optional(string)
          function  = string
          threshold = optional(number)
        }))
        where = optional(string)
      })
    })
    objective = object({
      description = optional(string)
      name        = optional(string)
      target      = number
      time_window = object({
        rolling = object({
          count = number
          unit  = string
        })
      })
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        length(trimspace(v.guid)) > 0
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        length(trimspace(v.name)) > 0
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.account_id >= 1
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        length(trimspace(v.events.valid_events.from)) > 0
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.valid_events.where == null || (length(trimspace(v.events.valid_events.where)) > 0)
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.valid_events.select == null || (v.events.valid_events.select.attribute == null || (length(trimspace(v.events.valid_events.select.attribute)) > 0))
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.valid_events.select == null || (contains(["COUNT", "SUM", "GET_CDF_COUNT", "GET_FIELD"], v.events.valid_events.select.function))
      )
    ])
    error_message = "must be one of: \"COUNT\", \"SUM\", \"GET_CDF_COUNT\", \"GET_FIELD\""
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.good_events == null || (length(trimspace(v.events.good_events.from)) > 0)
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.good_events == null || (v.events.good_events.where == null || (length(trimspace(v.events.good_events.where)) > 0))
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.good_events == null || (v.events.good_events.select == null || (v.events.good_events.select.attribute == null || (length(trimspace(v.events.good_events.select.attribute)) > 0)))
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.good_events == null || (v.events.good_events.select == null || (contains(["COUNT", "SUM", "GET_CDF_COUNT", "GET_FIELD"], v.events.good_events.select.function)))
      )
    ])
    error_message = "must be one of: \"COUNT\", \"SUM\", \"GET_CDF_COUNT\", \"GET_FIELD\""
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.bad_events == null || (length(trimspace(v.events.bad_events.from)) > 0)
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.bad_events == null || (v.events.bad_events.where == null || (length(trimspace(v.events.bad_events.where)) > 0))
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.bad_events == null || (v.events.bad_events.select == null || (v.events.bad_events.select.attribute == null || (length(trimspace(v.events.bad_events.select.attribute)) > 0)))
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        v.events.bad_events == null || (v.events.bad_events.select == null || (contains(["COUNT", "SUM", "GET_CDF_COUNT", "GET_FIELD"], v.events.bad_events.select.function)))
      )
    ])
    error_message = "must be one of: \"COUNT\", \"SUM\", \"GET_CDF_COUNT\", \"GET_FIELD\""
  }
  validation {
    condition = alltrue([
      for k, v in var.service_levels : (
        contains(["DAY"], v.objective.time_window.rolling.unit)
      )
    ])
    error_message = "must be one of: \"DAY\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

