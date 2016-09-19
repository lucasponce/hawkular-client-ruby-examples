require './functions.rb'

client_alerts = create_client.alerts

client_alerts.delete_action("email", "notify-admin-users")

delete_trigger_alerts_and_events(client_alerts, "my-auto-resolve-trigger")


