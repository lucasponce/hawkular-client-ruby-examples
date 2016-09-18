require './functions.rb'

client_alerts = create_client.alerts

delete_trigger_alerts_and_events(client_alerts, "my-test-trigger")
