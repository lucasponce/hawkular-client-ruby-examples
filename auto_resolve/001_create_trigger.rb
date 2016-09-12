require 'hawkular/hawkular_client'

entrypoint = "http://localhost:8080/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)

t = ::Hawkular::Alerts::Trigger.new('id'          => "my-auto-resolve-trigger",
                                    'name'        => "my-auto-resolve-trigger",
                                    'description' => "An example of auto_resolve trigger",
                                    'autoResolve' => true,
                                    'autoResolveAlerts' => true,
                                    'enabled'     => true)

# A firing condition is used to detect a "bad situation"
c1 = ::Hawkular::Alerts::Trigger::Condition.new({})
c1.trigger_mode = :FIRING
c1.data_id = "data-a"
c1.type = :THRESHOLD
c1.operator = :LT
c1.threshold = 5

# An autoresolve condition is used to detect when a "bad situation" has been resolved
c2 = ::Hawkular::Alerts::Trigger::Condition.new({})
c2.trigger_mode = :AUTORESOLVE
c2.data_id = "data-a"
c2.type = :THRESHOLD
c2.operator = :GTE
c2.threshold = 5

conds = [c1, c2]

client_alerts.create_trigger(t, conds)



