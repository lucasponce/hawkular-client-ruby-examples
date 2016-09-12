require 'hawkular/hawkular_client'

entrypoint = "http://localhost:8080/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)
client_metrics = Hawkular::Metrics::Client.new(entrypoint, credentials, options)

triggers = client_alerts.list_triggers

triggers.each do |t|
  puts "Trigger"
  p t
  trigger = client_alerts.get_single_trigger(t.id, true)
  conditions = trigger.conditions
  puts "Conditions"
  conditions.each do |c|
    p c
  end
  events = client_alerts.list_events({triggerIds: "#{t.id}"})
  puts "Events: #{events.length}"
  events.each do |e|
    p e
  end
  puts "----"
end
