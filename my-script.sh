git clone https://github.com/bsvihovec/tf_cloudless_sleepy.git
cd tf_cloudless_sleepy


#wget https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_darwin_amd64.zip
#unzip terraform_0.14.11_darwin_amd64.zip

wget https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip
unzip terraform_0.14.11_linux_amd64.zip

wget https://raw.githubusercontent.com/JonWoodlief/test-tfvars/main/schematics.tfvars

#export IC_TOKEN=$(ibmcloud iam oauth-tokens --output JSON | jq -r ".iam_token" | tr -d '\n')
#export IC_REFRESH=$(cat ~/.bluemix/config.json | jq -r ."IAMRefreshToken" | tr -d '\n')

export IC_API_IAM=https://iam.test.cloud.ibm.com
export IC_API_CATALOG=https://dev-cm.globalcatalog.test.cloud.ibm.com/api/v1-beta

# terraform provider needs these names
export IBMCLOUD_CATALOG_MANAGEMENT_API_ENDPOINT=$IC_API_CATALOG
export IBMCLOUD_IAM_API_ENDPOINT=$IC_API_IAM
#export IC_IAM_TOKEN=$IC_TOKEN
#export IC_IAM_REFRESH_TOKEN=$IC_REFRESH

export IC_API_KEY=$(cat ~/.key)

./terraform init
./terraform apply -state=terraform.tfstate -var-file=schematics.tfvars -auto-approve -no-color -lock=false
