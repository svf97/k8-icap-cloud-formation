# Dashboard documentation / AWS Compliance
 
- [AWS Compliance](#Instructions-to-have-the-tags-in-compliance)
- [access and use dashboards](#access-and-use-dashboards)


## instructions to have the tags in compliance.

*All instances should contain: • Delete: Yes/No (Any other values are treated as non-compliant and Stopped. All the instances that are marked as Delete: Yes will be deleted EOD).
• Owner (**Name of the VM creator**)

• Team (K8, GW) "**which team the VM belongs to**"

• Scope/Reason for “do not delete” VMs
 (**list the reasons why not to be deleted if the owner wants to be kept alive**)

• the process to delete VMs: Delete tag should contain either Yes/No
```
Note: If the VM is Non-compliant it gets executed automatically.
``` 
``` 
Note: the script is not periodic...it detects when instance gets created, started,stopped and will check required tags.
```

## access and use dashboards.

• access is for admins 

```
• Note: 
(There is no steps/procedures yet for access management for now, only shared accounts is supported)
```

![image (2)](https://user-images.githubusercontent.com/76431508/108069641-45842880-706c-11eb-9b19-c048ef57bd2f.png)
 
