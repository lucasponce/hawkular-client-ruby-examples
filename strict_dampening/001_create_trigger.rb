require './functions.rb'

client_alerts = create_client.alerts

t = ::Hawkular::Alerts::Trigger.new('id'          => "my-dampening-trigger",
                                    'name'        => "my-name",
                                    'description' => "a description",
                                    'enabled'     => true)

c1 = ::Hawkular::Alerts::Trigger::Condition.new({})
c1.trigger_mode = :FIRING
c1.data_id = "data-x"
c1.type = :THRESHOLD
c1.operator = :LT
c1.threshold = 5

d1 = ::Hawkular::Alerts::Trigger::Dampening.new({})
d1.type = :STRICT
d1.eval_true_setting = 2
d1.eval_total_setting = 2

client_alerts.create_trigger(t, [c1], [d1])



