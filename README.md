# hawkular-client-ruby-examples
Examples of use of Hawkular client in Ruby

# hello_world

Basic example where it is defined a trigger with two conditions.
Each condition defines a threshold for a metric.
An event is generated when both conditions are satisfied.

# auto_resolve

Introduction to alert lifecycle and autoresolve conditions.

* http://www.hawkular.org/blog/2015/08/25/hawkular-alerts-autoresolve.html

Hawkular can generate events or alerts where main difference is how lifecycle is manage.
Alerts are introduced here as a mechanism to manage a state of the resolution of an issue.

* http://www.hawkular.org/community/docs/developer-guide/alerts.html#_alerting_philosophy

# group_triggers

Group Triggers is a feature available in Hawkular Alerting to manage similar triggers from a single point.

* http://www.hawkular.org/community/docs/developer-guide/alerts.html#_group_triggers

## Versions used on these examples

* Hawkular Client version 2.6.0
* Hawkular Services 0.0.10.Final

## Hawkular Alerting Documentation

* http://www.hawkular.org/docs/components/alerts/index.html
* http://www.hawkular.org/community/docs/developer-guide/alerts.html
* http://www.hawkular.org/docs/rest/rest-alerts.html
