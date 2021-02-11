# k8-icap-cloud-formation
![k8-cloud-formation](https://user-images.githubusercontent.com/70108899/107366117-0c810c80-6ade-11eb-8753-289c28bd1135.png)

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
### Method 1:  AWS CLI

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
- If your have MFA token enabled for authentication to AWS account you should [set up MFA token authenticate through AWS CLI](https://aws.amazon.com/premiumsupport/knowledge-center/authenticate-mfa-cli/)
    - Run: `aws sts get-session-token --serial-number arn-of-the-mfa-device --token-code code-from-token`
    - Replace arn-of-the-mfa-device with your username and AWS number and enter MFA code as code-from-token 
    - Then export keys
        ```
        export AWS_ACCESS_KEY_ID=<Value>
        export AWS_SECRET_ACCESS_KEY=<Value>
        export AWS_SESSION_TOKEN= <Value>
        ```
- To create stack of loadbalancers, run
```
./create-stack.sh YOUR_ALLOCATION_ID NUMBER_OF_INSTANCES PROFILE_Name(Optional)
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

### Method 2: Launching with Click of Button
| Region           | Stack                                                                                                                                                                                                                                                                                                                                      |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Paris          | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-west-1#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) |
| Ohio  | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-east-2#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) |


- Click on one of the buttons above depending on the region you want to  work on
- When prompted with the image below, click Next 

![create-stack](https://user-images.githubusercontent.com/60857664/107665722-64fb0a00-6c96-11eb-9e05-ff00615e4e05.png)

- Add in your Elastic IP Allocation ID, AMI ID, & Key Name

![parameters](https://user-images.githubusercontent.com/60857664/107666135-d9ce4400-6c96-11eb-8c05-c54b6aa3d788.png)

- For the next page, leave everything at default, review and create stack