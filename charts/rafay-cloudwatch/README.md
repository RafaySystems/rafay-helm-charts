## Overview

This chart allows Rafay’s Kubernetes Operation platform audit logs to be sent to AWS CloudWatch so that security operations teams can perform forensics and analytics in a standardized manner.

The chart needs to be deployed on one of customer's managed clusters that has a line of sight to AWS CloudWatch. Once deployed, the "log aggregation" workload will automatically scrape the latest audit logs from the organization's audit logging system to the configured AWS CloudWatch log group. The audit log harvester workload can be operated on a small infrastructure cluster that is available 24/7.

For more information, refer here <https://docs.rafay.co/integrations/siem/configure-cloudwatch/>