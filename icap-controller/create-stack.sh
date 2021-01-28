STACK_NAME="icap-with-load-balancer--controller"
AMI="ami-09c44a4de6a377b3d"             # icap-server (controller)

REGION="eu-west-3"
PROFILE="785217600689_AdministratorAccess"
KEY_NAME="cf-icap_eu-west-3"
INSTANCE_COUNT="3"
ELASTIC_IP="eipalloc-0877b45a3322586f2"
INSTANCE_SIZE="c5.4xlarge"

aws cloudformation create-stack                                                             \
                --stack-name ${STACK_NAME}                                                  \
                --template-body file://../template.json                                        \
                --parameters ParameterKey=amiId,ParameterValue=${AMI}                       \
                             ParameterKey=KeyName,ParameterValue=${KEY_NAME}                \
                             ParameterKey=InstanceCount,ParameterValue=${INSTANCE_COUNT}    \
                             ParameterKey=ElasticIp,ParameterValue=${ELASTIC_IP}            \
                             ParameterKey=TagName,ParameterValue=${STACK_NAME}              \
                             ParameterKey=InstanceSize,ParameterValue=${INSTANCE_SIZE}      \
                --region $REGION                                                            \
                --profile $PROFILE
