require './functions.rb'

client_alerts = create_client.alerts

t = ::Hawkular::Alerts::Trigger.new('id'          => "my-test-trigger",
                                    'name'        => "my-name",
                                    'description' => "a description",
                                    'enabled'     => true)

c1 = ::Hawkular::Alerts::Trigger::Condition.new({})
c1.trigger_mode = :FIRING
# hm_g_ is a namespace to indicate that data-x is a gauge metric
c1.data_id = "hm_g_data-x"
c1.type = :THRESHOLD
c1.operator = :LT
c1.threshold = 5

c2 = ::Hawkular::Alerts::Trigger::Condition.new({})
c2.trigger_mode = :FIRING
# hm_g_ is a namespace to indicate that data-x is a gauge metric
c2.data_id = "hm_g_data-y"
c2.type = :THRESHOLD
c2.operator = :GT
c2.threshold = 5

conds = [c1, c2]

client_alerts.create_trigger(t, conds)



