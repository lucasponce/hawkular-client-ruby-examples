require './functions.rb'

client_alerts = create_client.alerts

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
