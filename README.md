Documentation EKS cluster using terraform 

Prerequisites:
- Create s3 bucket
- Create dynamodb table

Before we dive into writing Terraform code, it’s important to prepare the remote backend where our Terraform state will be stored. For this, we’ll be using an S3 bucket to hold the state file and a DynamoDB table to handle state locking. The S3 bucket ensures that the Terraform state is stored centrally and securely, while the DynamoDB table prevents multiple people or pipelines from making changes at the same time, avoiding conflicts. Setting this up is pretty straightforward: first, create an S3 bucket (I recommend enabling versioning so you can roll back state if needed), and then create a DynamoDB table with a partition key called LockID. Once these are ready, we’ll configure Terraform to use them, making our setup both reliable and team-friendly.


STEP 1: (Create directory structure)
-> Create backend directory (Where remote backend as well as state lock configuration will be configured)
-> Create another directory Modules and inside it create directory vpc and eks

STEP 2: (Configure remote backend and state locking in [backend directory])
-> Configure the backend directory with
	- terraform provider, 
	- aws provider, 
	- s3 bucket (for remote backend and state locking) , 
	- configure s3 backend and s3 native state locking (It reduces cost drastically).
-> For backend create s3 way before
-> For statelocking create DDB way before
-> Then mount them in your code
	
STEP 3: create VPC
-> Define variables such as vpc_cidr, subnets_cidrs (in a list type) etc
-> Write the main file:
	- create vpc block
	- create ig
	- public subnets
	- private subnets
	- Eips
	- Nat gateways
	- Route tables and its associations
	
	
STEP 4: Create EKS
-> Define all the variables
-> Create EKS role
-> Attach policy into EKS cluster role
-> Create EKS cluster itself
-> Create role of EKS worker node
-> Attach policies into the node role
-> At last create AWS managed EKS worker node(s)


~ Calling modules from root directory

In Terraform, the root directory acts as the entry point of your configuration, where you call and organize different child modules. To keep the setup clean and manageable, we typically split the configuration into a few standard files:

main.tf → Defines the actual resources and calls to child modules.
variables.tf → Declares input variables with their types and descriptions.
outputs.tf → Exposes useful values from the root module, such as resource IDs or endpoints.
terraform.tfvars → Provides the actual values for input variables, allowing flexibility across environments.

Now:
initialize the the terrafrom from root: terraform init
plan: terraform plan
apply: terraform apply -auto-approve
