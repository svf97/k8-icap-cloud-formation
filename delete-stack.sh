STACK_NAME="dinis-stack"
AMI="ami-00cd73b6db47ea463"
REGION="eu-west-3"
PROFILE="785217600689_AdministratorAccess"
KeyName="cf-icap_eu-west-3"

aws cloudformation delete-stack                                         \
                --stack-name ${STACK_NAME}                              \
                --region $REGION                                        \
                --profile $PROFILE
