require 'hawkular/hawkular_client'

entrypoint = "http://localhost:8080/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)

# Create a group trigger that would work as a template for
t = ::Hawkular::Alerts::Trigger.new('id'          => "my-group-trigger",
                                    'name'        => "my-group-trigger",
                                    'description' => "A Group Trigger is like a template trigger",
                                    'type'        => :GROUP,
                                    'eventType'   => :EVENT,
                                    'context'     => { "my-prop1" => "my-value" },
                                    'tags'        => { "my-tag" => "my-value1"},
                                    'enabled'     => true)

c1 = ::Hawkular::Alerts::Trigger::Condition.new({})
c1.trigger_mode = :FIRING
c1.data_id = "generic-metric-b"
c1.type = :THRESHOLD
c1.operator = :LT
c1.threshold = 5

c2 = ::Hawkular::Alerts::Trigger::Condition.new({})
c2.trigger_mode = :FIRING
c2.data_id = "generic-metric-c"
c2.type = :THRESHOLD
c2.operator = :GTE
c2.threshold = 5

conditions = ::Hawkular::Alerts::Trigger::GroupConditionsInfo.new([c1, c2])

client_alerts.create_group_trigger(t)
client_alerts.set_group_conditions(t.id, :FIRING, conditions)
