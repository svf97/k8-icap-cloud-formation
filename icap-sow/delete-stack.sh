STACK_NAME="icap-with-load-balancer--sow"
REGION="eu-west-3"
PROFILE="785217600689_AdministratorAccess"

aws cloudformation delete-stack                                         \
                --stack-name ${STACK_NAME}                              \
                --region $REGION                                        \
                --profile $PROFILE
