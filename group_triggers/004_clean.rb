require 'hawkular/hawkular_client'

entrypoint = "http://#{ENV['HAWKULAR_HOST'] || 'localhost'}:#{ENV['HAWKULAR_PORT'] || 8080}/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)

def delete_trigger_alerts_and_events(client_alerts, trigger_id)
  client_alerts.delete_trigger(trigger_id)
  events = client_alerts.list_events({triggerIds: trigger_id})
  events.each do |e|
    # A delete with criteria is not yet mapped into the ruby gem
    client_alerts.http_delete("/events/#{e.id}")
  end
  alerts = client_alerts.list_alerts({triggerIds: trigger_id})
  alerts.each do |a|
    # A delete with criteria is not yet mapped into the ruby gem
    client_alerts.http_delete("/#{a.id}")
  end
end

delete_trigger_alerts_and_events(client_alerts, "my-member-trigger-for-machine1")
delete_trigger_alerts_and_events(client_alerts, "my-member-trigger-for-machine2")
delete_trigger_alerts_and_events(client_alerts, "my-member-trigger-for-machine3")
client_alerts.delete_group_trigger("my-group-trigger")


