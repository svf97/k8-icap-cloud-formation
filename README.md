# k8-icap-cloud-formation


## Prerequisites
To run this provided cloud formation script you will need to have:

- AWS account with CloudFormation access to create & delete stacks
- AWS CLI
- PEM key pair
- Elastic IP pre-created & its corresponding Allocation ID

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

- Clone the repo 
```
git clone https://github.com/k8-proxy/k8-icap-cloud-formation.git
```
- Navigate to `icap-controller` & pick a region
```
cd k8-icap-cloud-formation/icap-controller/us-east-2
```
- Configure your AWS CLI with your
    - AWS Access Key ID
    - AWS Secret Access Key
    - Default region name
    - Default output format > JSON
```
aws configure
```
- To create stack of loadbalancers, run
```
./create-stack.sh YOUR_ALLOCATION_ID NUMBER_OF_INSTANCES
``` 
Example Output:
```
************************************************************

**** Creating EC2 servers via cloud formation           ****

in us-east-2 creating 2 servers mapped to elastic ip YOUR_ALLOCATION_ID
{
    "StackId": "arn:aws:cloudformation:us-east-2:..."
}
```
- To get loadbalancer DNS name:
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