git clone https://github.com/bsvihovec/tf_cloudless_sleepy.git
cd tf_cloudless_sleepy


#wget https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_darwin_amd64.zip
#unzip terraform_0.14.11_darwin_amd64.zip

wget https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip
unzip terraform_0.14.11_linux_amd64.zip

wget https://raw.githubusercontent.com/JonWoodlief/test-tfvars/main/schematics.tfvars

export IBMCLOUD_CATALOG_MANAGEMENT_API_ENDPOINT=https://dev-cm.globalcatalog.test.cloud.ibm.com/api/v1-beta
export IBMCLOUD_IAM_API_ENDPOINT=https://iam.test.cloud.ibm.com
export IC_API_KEY=$(cat ~/.key)

./terraform init
./terraform apply -state=terraform.tfstate -var-file=schematics.tfvars -auto-approve -no-color -lock=false
