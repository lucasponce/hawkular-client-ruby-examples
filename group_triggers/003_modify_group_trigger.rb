require 'hawkular/hawkular_client'

entrypoint = "http://#{ENV['HAWKULAR_HOST'] || 'localhost'}:#{ENV['HAWKULAR_PORT'] || 8080}/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)

group_trigger = client_alerts.get_single_trigger("my-group-trigger", true)

# We change the thresholds on the group trigger
group_trigger.conditions[0].threshold = 50
group_trigger.conditions[1].threshold = 50

conditions = ::Hawkular::Alerts::Trigger::GroupConditionsInfo.new(group_trigger.conditions)

# Now, all members from group trigger have changed the threshold on same step
client_alerts.set_group_conditions("my-group-trigger", :FIRING, conditions)





