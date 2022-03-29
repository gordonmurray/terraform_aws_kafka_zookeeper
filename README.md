# Terraform AWS Kafka
Create a kafka cluster on AWS using Terraform



## Cost estimate

Cost estimate provider by Infracost

```
Project: gordonmurray/terraform_aws_kafka/.

 Name                                                  Monthly Qty  Unit   Monthly Cost

 aws_instance.kafka[0]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.large)           730  hours        $66.58
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                       50  GB            $5.50

 aws_instance.kafka[1]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.large)           730  hours        $66.58
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                       50  GB            $5.50

 aws_instance.kafka[2]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.large)           730  hours        $66.58
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                       50  GB            $5.50

 aws_instance.zookeeper[0]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.medium)          730  hours        $33.29
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                       50  GB            $5.50

 aws_instance.zookeeper[1]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.medium)          730  hours        $33.29
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                       50  GB            $5.50

 aws_instance.zookeeper[2]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.medium)          730  hours        $33.29
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                       50  GB            $5.50

 OVERALL TOTAL                                                                  $332.59
──────────────────────────────────
9 cloud resources were detected, rerun with --show-skipped to see details:
∙ 6 were estimated, 6 include usage-based costs, see https://infracost.io/usage-file
∙ 3 were free
```