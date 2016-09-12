require 'hawkular/hawkular_client'

entrypoint = "http://localhost:8080/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)

member_trigger1 = ::Hawkular::Alerts::Trigger::GroupMemberInfo.new
member_trigger1.group_id = "my-group-trigger"
member_trigger1.member_id = "my-member-trigger-for-machine1"
member_trigger1.member_name = "my-group-trigger for machine1"
member_trigger1.member_context = {'whateverkey' => "some specific context for machine1"}
member_trigger1.data_id_map = { "generic-metric-b" => "metric-b-machine1",  "generic-metric-c" => "metric-b-machine1" }

client_alerts.create_member_trigger(member_trigger1)


member_trigger2 = ::Hawkular::Alerts::Trigger::GroupMemberInfo.new
member_trigger2.group_id = "my-group-trigger"
member_trigger2.member_id = "my-member-trigger-for-machine2"
member_trigger2.member_name = "my-group-trigger for machine2"
member_trigger2.member_context = {'whateverkey' => "some specific context for machine2"}
member_trigger2.data_id_map = { "generic-metric-b" => "metric-b-machine2",  "generic-metric-c" => "metric-b-machine2" }

client_alerts.create_member_trigger(member_trigger2)

member_trigger3 = ::Hawkular::Alerts::Trigger::GroupMemberInfo.new
member_trigger3.group_id = "my-group-trigger"
member_trigger3.member_id = "my-member-trigger-for-machine3"
member_trigger3.member_name = "my-group-trigger for machine3"
member_trigger3.member_context = {'whateverkey' => "some specific context for machine3"}
member_trigger3.data_id_map = { "generic-metric-b" => "metric-b-machine3",  "generic-metric-c" => "metric-b-machine3" }

client_alerts.create_member_trigger(member_trigger3)


