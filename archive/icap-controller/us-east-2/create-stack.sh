# **** us-east-2 ***** 
# 
 
# Elastric IPs in us-east-2 
#    eipalloc-049965879584d3328  : 3.139.5.226      (30 servers)    v2
#    eipalloc-035c9d116a13745be  : 3.139.32.13      (25 servers)    v1
#    eipalloc-0f29d592c099ca8a8  : 18.216.36.55     (40 servers)    v2

REGION="us-east-2"
ELASTIC_IP=$1
INSTANCE_COUNT=$2

echo "************************************************************"
echo 
echo "**** Creating EC2 servers via cloud formation           ****"
echo
echo "in ${REGION} creating ${INSTANCE_COUNT} servers mapped to elastic ip ${ELASTIC_IP}"


# **** us-east-2 ***** 

ELASTIC_IP=$1
INSTANCE_COUNT=$2
STACK_NAME=$ELASTIC_IP
AMI="ami-0cd0b2d048f8e2a89"              # icap-server (controller v0.2) us-east-2
#AMI="ami-02400dfefefc074db"             # icap-server (controller) us-east-2
#PROFILE="${3:-default}"
#PROFILE="{785217600689_AdministratorAccess}"
KEY_NAME="cf-icap_us-east-2"
INSTANCE_SIZE="t2.xlarge" # c5.4xlarge" #"i3.2xlarge" 

aws cloudformation create-stack                                                             \
                --stack-name ${STACK_NAME}                                                  \
                --template-body file://../../template.json                                  \
                --parameters ParameterKey=amiId,ParameterValue=${AMI}                       \
                             ParameterKey=KeyName,ParameterValue=${KEY_NAME}                \
                             ParameterKey=InstanceCount,ParameterValue=${INSTANCE_COUNT}    \
                             ParameterKey=ElasticIp,ParameterValue=${ELASTIC_IP}            \
                             ParameterKey=InstanceSize,ParameterValue=${INSTANCE_SIZE}      \
                             ParameterKey=TagName,ParameterValue=${STACK_NAME}              \
                             ParameterKey=TargetGroupName,ParameterValue=${STACK_NAME}      \
                             ParameterKey=icapLbName,ParameterValue=${STACK_NAME}           \
                --region $REGION                                                            \
