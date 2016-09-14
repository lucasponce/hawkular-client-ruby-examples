require 'hawkular/hawkular_client'

entrypoint = "http://#{ENV['HAWKULAR_HOST'] || 'localhost'}:#{ENV['HAWKULAR_PORT'] || 8080}/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)

events = client_alerts.list_events({triggerIds: "my-auto-resolve-trigger"})
puts "Events: #{events.length}"
events.each do |e|
  puts "Status: #{e.status}"
  p e
end

alerts = client_alerts.list_alerts({triggerIds: "my-auto-resolve-trigger"})
puts "Alerts: "
alerts.each do |a|
  puts "Status: #{a.status}"
  p a
end
