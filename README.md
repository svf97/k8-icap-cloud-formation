# k8-icap-cloud-formation

To craete stack, run below command:

```shell
aws cloudformation create-stack --stack-name icapstack --template-body file://template.json --parameters ParameterKey=amiId,ParameterValue=ami-0076cc992990f6173
```
#### Parameters: 
```shell
    InstanceCount : Count of instances required, Default : 4
    amiId : AMI ID, Required: Yes
    InstanceSize: Size of Instance required, Default: t2.xlarge
```

```shell

aws cloudformation create-stack --stack-name icapstack --template-body file://template.json --parameters ParameterKey=amiId,ParameterValue=ami-0076cc992990f6173

aws cloudformation create-stack --stack-name icapstack --template-body file:///home/minion/glasswall/k8-icap-cloud-formation/template.json --parameters ParameterKey=amiId,ParameterValue=ami-0076cc992990f6173 ParameterKey=InstanceCount,ParameterValue=2

aws cloudformation create-stack --stack-name icapstack --template-body file:///home/minion/glasswall/k8-icap-cloud-formation/template.json --parameters ParameterKey=amiId,ParameterValue=ami-0076cc992990f6173 ParameterKey=InstanceCount,ParameterValue=2 ParameterKey=InstanceSize,ParameterValue=t2.large
```

To get loadbalancer DNS name:
```shell
    aws cloudformation describe-stacks --stack-name icapstack
```
Exmple output:
```shell
"Outputs": [
                {
                    "OutputKey": "icapLoadBalancerDNSName",
                    "OutputValue": "icapLb-e970d3d3e47e0e78.elb.us-east-2.amazonaws.com",
                    "Description": "The DNSName of load balancer"
                }
            ]
```