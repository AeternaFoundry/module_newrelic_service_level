resource "newrelic_service_level" "service_levels" {
  for_each = var.service_levels

  guid        = each.value.guid
  name        = each.value.name
  description = each.value.description

  events {
    account_id = each.value.events.account_id
    dynamic "bad_events" {
      for_each = each.value.events.bad_events != null ? [each.value.events.bad_events] : []
      content {
        from = bad_events.value.from
        dynamic "select" {
          for_each = bad_events.value.select != null ? [bad_events.value.select] : []
          content {
            attribute = select.value.attribute
            function  = select.value.function
            threshold = select.value.threshold
          }
        }
        where = bad_events.value.where
      }
    }
    dynamic "good_events" {
      for_each = each.value.events.good_events != null ? [each.value.events.good_events] : []
      content {
        from = good_events.value.from
        dynamic "select" {
          for_each = good_events.value.select != null ? [good_events.value.select] : []
          content {
            attribute = select.value.attribute
            function  = select.value.function
            threshold = select.value.threshold
          }
        }
        where = good_events.value.where
      }
    }
    valid_events {
      from = each.value.events.valid_events.from
      dynamic "select" {
        for_each = each.value.events.valid_events.select != null ? [each.value.events.valid_events.select] : []
        content {
          attribute = select.value.attribute
          function  = select.value.function
          threshold = select.value.threshold
        }
      }
      where = each.value.events.valid_events.where
    }
  }

  objective {
    description = each.value.objective.description
    name        = each.value.objective.name
    target      = each.value.objective.target
    time_window {
      rolling {
        count = each.value.objective.time_window.rolling.count
        unit  = each.value.objective.time_window.rolling.unit
      }
    }
  }
}

