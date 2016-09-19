require './functions.rb'

client_metrics = create_client.metrics

# This data will trigger an autoresolve trigger
client_metrics.gauges.push_data("data-a", value: 6)
client_metrics.gauges.push_data("data-a", value: 7)
client_metrics.gauges.push_data("data-a", value: 8)
client_metrics.gauges.push_data("data-a", value: 9)
