STACK_NAME="dinis-stack-with-el-ip"
AMI="ami-09c44a4de6a377b3d"             # icap-server (controller)

REGION="eu-west-3"
PROFILE="785217600689_AdministratorAccess"
KEY_NAME="cf-icap_eu-west-3"
INSTANCE_COUNT="5"
ELASTIC_IP="eipalloc-0877b45a3322586f2"

aws cloudformation create-stack                                                             \
                --stack-name ${STACK_NAME}                                                  \
                --template-body file://template.json                                        \
                --parameters ParameterKey=amiId,ParameterValue=${AMI}                       \
                             ParameterKey=KeyName,ParameterValue=${KEY_NAME}                \
                             ParameterKey=InstanceCount,ParameterValue=${INSTANCE_COUNT}   \
                             ParameterKey=ElasticIp,ParameterValue=${ELASTIC_IP}   \
                --region $REGION                                                            \
                --profile $PROFILE
