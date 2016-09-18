require 'hawkular/hawkular_client'

def delete_trigger_alerts_and_events(client_alerts, trigger_id)
  trigger = client_alerts.get_single_trigger(trigger_id, true)
  if trigger.type == 'GROUP'
    client_alerts.delete_group_trigger(trigger_id)
  else
    client_alerts.delete_trigger(trigger_id)
    events = client_alerts.list_events({triggerIds: trigger_id})
    events.each do |e|
      # A delete with criteria is not yet mapped into the ruby gem
      client_alerts.http_delete("/events/#{e.id}")
    end
    alerts = client_alerts.list_alerts({triggerIds: trigger_id})
    alerts.each do |a|
      # A delete with criteria is not yet mapped into the ruby gem
      client_alerts.http_delete("/#{a.id}")
    end
  end
end

def create_client
  Hawkular::Client.new(
    entrypoint: "http://#{ENV['HAWKULAR_HOST'] || 'localhost'}:#{ENV['HAWKULAR_PORT'] || 8080}",
    credentials: {username: "jdoe", password: "password"},
    options: {tenant: "hawkular"}
  )
end

def check_boolean_input(msg)
  input = ''
  until %w(Y N).include?(input)
    puts "#{msg}(Y/N)?"
    input = gets.chomp.upcase
  end
  if input == 'Y'
    yield
  end
end