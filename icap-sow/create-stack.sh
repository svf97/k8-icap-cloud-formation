STACK_NAME="icap-with-load-balancer--sow"
AMI="ami-0579a3d44338b3ba5"             # icap-server (sow)

REGION="eu-west-3"
PROFILE="785217600689_AdministratorAccess"
KEY_NAME="cf-icap_eu-west-3"
INSTANCE_COUNT="5"
ELASTIC_IP="eipalloc-078540168b5b7686d"
INSTANCE_SIZE="c5.4xlarge"  #"t2.xlarge"

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
                --region $REGION                                                            \
                --profile $PROFILE
