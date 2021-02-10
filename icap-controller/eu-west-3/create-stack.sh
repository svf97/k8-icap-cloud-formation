# **** eu-west-3 ***** 
# 
# Elastric IPs in eu-west-3 
#   eipalloc-0877b45a3322586f2 : 35.181.68.251  ( servers)           
#   eipalloc-03be0f9ffddb671b4 : 35.181.126.113 (10 servers)  - 4th Feb

#   eipalloc-0293bbe1a4fa8c82e : 52.47.204.173  (no vCPU)



REGION="eu-west-3"
ELASTIC_IP=$1
INSTANCE_COUNT=$2

echo "************************************************************"
echo 
echo "**** Creating EC2 servers via cloud formation           ****"
echo
echo "in ${REGION} creating ${INSTANCE_COUNT} servers mapped to elastic ip ${ELASTIC_IP}"


AMI="ami-09c44a4de6a377b3d"             # icap-server (controller) eu-west-2
PROFILE="{$3:-default}"
#PROFILE="785217600689_AdministratorAccess"
KEY_NAME="cf-icap_eu-west-3"
#ELASTIC_IP="eipalloc-0293bbe1a4fa8c82e" # eipalloc-03be0f9ffddb671b4" #"eipalloc-0877b45a3322586f2"
STACK_NAME=$ELASTIC_IP
INSTANCE_SIZE="t2.xlarge" #"c5.4xlarge" #"i3.2xlarge" 

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
                --profile $PROFILE
