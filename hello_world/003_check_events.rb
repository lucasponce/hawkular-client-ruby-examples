require 'hawkular/hawkular_client'

entrypoint = "http://#{ENV['HAWKULAR_HOST'] || 'localhost'}:#{ENV['HAWKULAR_PORT'] || 8080}/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)

events = client_alerts.list_events({triggerIds: "my-test-trigger"})
puts "Events: #{events.length}"
events.each do |e|
  p e
end
