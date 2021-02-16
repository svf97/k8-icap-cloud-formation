STACK_NAME=$1
#STACK_NAME="icap-with-load-balancer--controller"
REGION="eu-west-3"
#PROFILE="${2:-default}"
#PROFILE="785217600689_AdministratorAccess"

aws cloudformation delete-stack                                         \
                --stack-name ${STACK_NAME}                              \
                --region $REGION                                        \
