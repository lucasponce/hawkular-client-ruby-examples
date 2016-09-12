require 'hawkular/hawkular_client'

entrypoint = "http://localhost:8080/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_metrics = Hawkular::Metrics::Client.new(entrypoint, credentials, options)

client_metrics.gauges.push_data("data-x", value: 4)
client_metrics.gauges.push_data("data-y", value: 6)