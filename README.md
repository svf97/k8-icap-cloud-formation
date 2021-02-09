# k8-icap-cloud-formation


## Prerequisites
To run this provided cloud formation script you will need to have:

- AWS account with CloudFormation access to create & delete stacks
- AWS CLI
- PEM key pair
- Elastic IP pre-created

### Parameters
The following are the parameters on `template.json` that can be modified

```
    stack-name : Name of CloudFormation stack
    amiId : AMI ID, Required: Yes
    KeyName: Name of pem file to be used while creating instance
    InstanceCount : Count of instances required, Default : 4
    ElasticIp: Allocation id of elastic ip to be assigned to load balancer
    InstanceSize: Size of Instance required, Default: t2.xlarge
    TagName: Tag to be used as Name for all resources, Default: cf-created-ec2
    TargetGroupName: Tag to be used as name of Target group, Default: NewicapLBTargetGroup
    icapLbName: Tag to be used as name of Icap load balancer, Default: icapLbName
    Ec2RootVolumeSize: Size in GB for root volume to be mounted to instance, Default: 64
    region: Region in which all resources are to be launched
```

## Create stack of ICAP Servers

## Create stack of Loadbalancers


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