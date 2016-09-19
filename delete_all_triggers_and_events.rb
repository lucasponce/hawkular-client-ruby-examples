require './functions.rb'

client_alerts = create_client.alerts

check_boolean_input('Really delete all triggers events and alerts?') do
  triggers = client_alerts.list_triggers
  triggers.each do |t|
    p "Deleting trigger: #{t.id}"
    delete_trigger_alerts_and_events(client_alerts, t.id)
  end
end


