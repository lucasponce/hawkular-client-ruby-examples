require './functions.rb'

client_alerts = create_client.alerts

delete_trigger_alerts_and_events(client_alerts, "my-member-trigger-for-machine1")
delete_trigger_alerts_and_events(client_alerts, "my-member-trigger-for-machine2")
delete_trigger_alerts_and_events(client_alerts, "my-member-trigger-for-machine3")
delete_trigger_alerts_and_events(client_alerts, "my-group-trigger")


