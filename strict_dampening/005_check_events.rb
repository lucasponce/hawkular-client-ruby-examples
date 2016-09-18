require './functions.rb'

client_alerts = create_client.alerts

events = client_alerts.list_events({triggerIds: "my-dampening-trigger"})
puts "Events: #{events.length}"
events.each do |e|
  p e
end
