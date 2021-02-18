# Dashboard documentation / AWS Compliance
 
- [AWS Compliance](#Instructions-to-have-the-tags-in-compliance)
- [Access and dashboards](#Access-and-dashboards)


## Instructions to have the VMs created in AWS in compliance

*All instances should contain the following 4 tags:

• Delete: Yes/No (Any other values are treated as non-compliant and VM is stopped. All the instances that are marked as Delete: Yes will be deleted EOD).

• Owner (**Name of the VM creator**)

• Team (K8, GW, Sales) "**which team the VM belongs to**"

• Scope/Reason for “do not delete” VMs
 (**list the reasons why not to be deleted if the owner wants to be kept alive**)
 
 
 ## Delete and stop VMs process

• VMs that are non-compliant, will be stopped, but not deleted. Only VMs tagged to Delete:Yes will be deleted.

```
Note: If the VM is Non-compliant it gets stopped automatically. The script is not periodic, it detects when an instance gets created, started, stopped and checks required tags.
``` 


## Access and dashboards

• Dashboard access is only for AWS administrators. 

```
• Note: 
(There is no steps/procedures yet for access management for now, only shared accounts is supported)
```

![image (2)](https://user-images.githubusercontent.com/76431508/108069641-45842880-706c-11eb-9b19-c048ef57bd2f.png)
 
