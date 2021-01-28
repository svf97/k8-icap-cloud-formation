#AMI="ami-0b996fbb8d6a83ef0"

STACK_NAME="dinis-stack"
AMI="ami-00cd73b6db47ea463"
REGION="eu-west-3"
PROFILE="785217600689_AdministratorAccess"
KEY_NAME="cf-icap_eu-west-3"

aws cloudformation create-stack                                                \
                --stack-name ${STACK_NAME}                                     \
                --template-body file://template.json                           \
                --parameters ParameterKey=amiId,ParameterValue=${AMI}          \
                             ParameterKey=KeyName,ParameterValue=${KEY_NAME}   \
                --region $REGION                                               \
                --profile $PROFILE

