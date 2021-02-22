source ./config.env
echo "************************************************************"
echo 
echo "**** Creating EC2 servers via cloud formation           ****"
echo
echo "in ${REGION} creating ${INSTANCE_COUNT} servers mapped to elastic ip ${ELASTIC_IP}"


aws cloudformation create-stack                                                             \
                --stack-name ${STACK_NAME}                                                  \
                --template-body file://../template.json                                  \
                --parameters ParameterKey=amiId,ParameterValue=${AMI_ID}                       \
                             ParameterKey=KeyName,ParameterValue=${KEY_NAME}                \
                             ParameterKey=InstanceCount,ParameterValue=${INSTANCE_COUNT}    \
                             ParameterKey=ElasticIp,ParameterValue=${ELASTIC_IP}            \
                             ParameterKey=InstanceSize,ParameterValue=${INSTANCE_SIZE}      \
                             ParameterKey=TagName,ParameterValue=${EC2_Name}                \
                             ParameterKey=TargetGroupName,ParameterValue=${ICAPT_TargetGroup_Name}      \
                             ParameterKey=icapLbName,ParameterValue=${ICAP_LB_Name}           \
                             ParameterKey=CidrIp,ParameterValue=${SG_CIDR}                  \
                             ParameterKey=Ec2RootVolumeSize,ParameterValue=${EC2_Volume_size}                  \
                --region $REGION                                                            \
