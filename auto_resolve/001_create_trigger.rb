require './functions.rb'

client_alerts = create_client.alerts

# On this example we are going to create a preliminar email action
# Actions are executed on alerts lifecycle
# Actions can be shared per triggers
client_alerts.create_action("email", "notify-admin-users", { "to" => "admins@hawkular.org", "cc" => "developers@hawkular.org" })

# Create the auto-resolve trigger
t = ::Hawkular::Alerts::Trigger.new('id'          => "my-auto-resolve-trigger",
                                    'name'        => "my-auto-resolve-trigger",
                                    'description' => "An example of auto_resolve trigger",
                                    'autoResolve' => true,
                                    'autoResolveAlerts' => true,
                                    'enabled'     => true)
# We point this trigger with the action created
t.actions = [{"actionPlugin" => "email", "actionId" => "notify-admin-users"}]

# A firing condition is used to detect a "bad situation"
c1 = ::Hawkular::Alerts::Trigger::Condition.new({})
c1.trigger_mode = :FIRING
# hm_g_ is a namespace to indicate that data-x is a gauge metric
c1.data_id = "hm_g_data-a"
c1.type = :THRESHOLD
c1.operator = :LT
c1.threshold = 5

# An autoresolve condition is used to detect when a "bad situation" has been resolved
c2 = ::Hawkular::Alerts::Trigger::Condition.new({})
c2.trigger_mode = :AUTORESOLVE
# hm_g_ is a namespace to indicate that data-x is a gauge metric
c2.data_id = "hm_g_data-a"
c2.type = :THRESHOLD
c2.operator = :GTE
c2.threshold = 5

conds = [c1, c2]

client_alerts.create_trigger(t, conds)




