# k8-icap-cloud-formation

#### Prerequisite: 
To run this provided cloud formation script you will need to have PEM key pair and Elastic IP pre-created.

To create stack, run below command:

```shell
aws cloudformation create-stack                                                             \
                --stack-name ${STACK_NAME}                                                  \
                --template-body file://../template.json                                     \
                --parameters ParameterKey=amiId,ParameterValue=${AMI}                       \
                             ParameterKey=KeyName,ParameterValue=${KEY_NAME}                \
                             ParameterKey=InstanceCount,ParameterValue=${INSTANCE_COUNT}    \
                             ParameterKey=ElasticIp,ParameterValue=${ELASTIC_IP}            \
                             ParameterKey=InstanceSize,ParameterValue=${INSTANCE_SIZE}      \
                             ParameterKey=TagName,ParameterValue=${STACK_NAME}              \
                             ParameterKey=TargetGroupName,ParameterValue=${STACK_NAME}      \
                             ParameterKey=icapLbName,ParameterValue=${STACK_NAME}           \
                             ParameterKey=Ec2RootVolumeSize,ParameterValue=${Ec2RootVolumeSize}    \
                --region $REGION 

```
#### Parameters: 
```shell
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