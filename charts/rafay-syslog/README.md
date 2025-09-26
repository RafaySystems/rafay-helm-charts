## Overview

This chart allows Rafay’s Kubernetes Operation platform audit logs to be sent to syslog so that security operations teams can perform forensics and analytics in a standardized manner.

The chart needs to be deployed on one of customer's managed clusters that has a line of sight to the syslog aggregation endpoint. This ensures that audit logs can be aggregated in scenarios where the aggregation endpoints are not directly visible and not open on the Internet. Once deployed, the "log aggregation" workload will automatically scrape the latest audit logs from the organization's audit logging system to the configured syslog instance (self hosted or Cloud). The audit log harvester workload can be operated on a small infrastructure cluster that is available 24/7.

For more information, refer here <https://docs.rafay.co/integrations/siem/configure-syslog/>