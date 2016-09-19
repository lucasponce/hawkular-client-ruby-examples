require './functions.rb'

client_metrics = create_client.metrics

# This first data will trigger an alert
client_metrics.gauges.push_data("data-a", value: 4)
# This other data < 5 will not trigger a new trigger, as now a bad condition (data-a < 5) is detected
# Then the trigger changes its state to wait until this condition is gone
client_metrics.gauges.push_data("data-a", value: 3)
client_metrics.gauges.push_data("data-a", value: 2)
client_metrics.gauges.push_data("data-a", value: 4)
client_metrics.gauges.push_data("data-a", value: 2)