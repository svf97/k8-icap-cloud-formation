STACK_NAME=$1
AMI=$2
ELASTIC_IP=$3
REGION=$4
INSTANCE_COUNT=$5
KEY_NAME=$6
INSTANCE_SIZE=$7
CIDR=$8

echo "************************************************************"
echo 
echo "**** Creating EC2 servers via cloud formation           ****"
echo
echo "in ${REGION} creating ${INSTANCE_COUNT} servers mapped to elastic ip ${ELASTIC_IP}"


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
                             ParameterKey=CidrIp,ParameterValue=${CIDR}                     \
                --region $REGION                                                            \
