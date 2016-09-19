require './functions.rb'

client_alerts = create_client.alerts

group_trigger = client_alerts.get_single_trigger("my-group-trigger", true)

# We change the thresholds on the group trigger
group_trigger.conditions[0].threshold = 50
group_trigger.conditions[1].threshold = 50

conditions = ::Hawkular::Alerts::Trigger::GroupConditionsInfo.new(group_trigger.conditions)

# Now, all members from group trigger have changed the threshold on same step
client_alerts.set_group_conditions("my-group-trigger", :FIRING, conditions)





