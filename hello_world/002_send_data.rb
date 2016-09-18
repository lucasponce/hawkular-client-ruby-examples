require './functions.rb'

client_metrics = create_client.metrics

client_metrics.gauges.push_data("data-x", value: 4)
client_metrics.gauges.push_data("data-y", value: 6)