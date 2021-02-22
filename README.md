# k8-icap-cloud-formation
![k8-cloud-formation](https://user-images.githubusercontent.com/70108899/107366117-0c810c80-6ade-11eb-8753-289c28bd1135.png)

## Prerequisites
To run this provided cloud formation script you will need to have:

- AWS account with CloudFormation access to create & delete stacks
- AWS CLI
- Latest ICAP AMI present in same region in which stack to be created. Take a note of AMI ID
- Create a new Key pair or take a note of exisisting key pair to be used. It is mandatory for key pair to be present in same region in which stack is to be created
- Create a new elastic ip or take a note of allocation id existing elastic ip. It is mandatory for elastic ip to be present in same region in which stack is to be created
  

### Parameters
The following are the parameters present in `config.env.example` file present in `icap` folder which are required as inputs to Cloudformation template.

```
    STACK_NAME : Name of CloudFormation stack
    AMI_ID : AMI ID, Required: Yes
    KEY_NAME: Name of pem file to be used while creating instance
    INSTANCE_COUNT : Count of instances required, Default : 2
    ELASTIC_IP: Allocation id of elastic ip to be assigned to load balancer
    INSTANCE_SIZE: Size of Instance required, Default: t2.xlarge
    EC2_Name: Tag to be used as Name for all resources, Default: IcapCfServer
    ICAPT_TargetGroup_Name: Tag to be used as name of Target group, Default: IcapTargetGroupCF
    ICAP_LB_Name: Tag to be used as name of Icap load balancer, Default: IcapLoadBalancerCF
    EC2_Volume_size: Size in GB for root volume to be mounted to instance, Default: 64
    REGION: Region in which all resources are to be launched
    SG_CIDR: CIDR for allowing inbound connections to ICAP server (Ports: 22,1344,1355,443,7000)
```

## Create stack of Icap servers behind Loadbalancer
### Method 1:  AWS CLI
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
     
- Clone the repo 
```
git clone https://github.com/k8-proxy/k8-icap-cloud-formation.git

cd k8-icap-cloud-formation/icap

chmod +x create-stack.sh

chmod +x delete-stack.sh
```
- Create `config.env` from `config.env.example` . Update values of various paramters in `config.env` as required and save the file.
```
cp config.env.example config.env
```
- By executing below command, speicified number of instances will be created along with a load balancer which will balance traffic to these instances. 
```
./create-stack.sh
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
| Ireland          | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-west-1#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) |
| London          | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-west-2#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) |
| Frankfurt          | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-central-1#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) |
| Paris          | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=eu-west-3#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) |
| Ohio  | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-east-2#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) | 
| N. Virginia  | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) | 
| N. California  | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-west-1#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) | 
| Oregon  | [<img src="https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png">](https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=IcapLoadBalancerStack&templateURL=http://icap-cloudformation-template.s3-eu-west-1.amazonaws.com/template.json) | 


- Click on one of the buttons above depending on the region you want to  work on
- When prompted with the image below, click Next 

![create-stack](https://user-images.githubusercontent.com/60857664/107665722-64fb0a00-6c96-11eb-9e05-ff00615e4e05.png)

- Add in your Elastic IP Allocation ID, AMI ID, & Key Name

![parameters](https://user-images.githubusercontent.com/60857664/107666135-d9ce4400-6c96-11eb-8c05-c54b6aa3d788.png)

- For the next page, leave everything at default, review and create stack