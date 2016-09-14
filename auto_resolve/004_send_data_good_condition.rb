require 'hawkular/hawkular_client'

entrypoint = "http://#{ENV['HAWKULAR_HOST'] || 'localhost'}:#{ENV['HAWKULAR_PORT'] || 8080}/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_metrics = Hawkular::Metrics::Client.new(entrypoint, credentials, options)

# This data will trigger an autoresolve trigger
client_metrics.gauges.push_data("data-a", value: 6)
client_metrics.gauges.push_data("data-a", value: 7)
client_metrics.gauges.push_data("data-a", value: 8)
client_metrics.gauges.push_data("data-a", value: 9)
