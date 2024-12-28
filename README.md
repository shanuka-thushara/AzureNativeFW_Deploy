# Azure Firewall Deployment

This project contains Terraform configurations to deploy an Azure Firewall along with its associated resources in Azure.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An Azure account with the necessary permissions to create resources.
- Azure CLI installed and authenticated.

## Deployment Steps

1. **Clone the repository**

   ```sh
   git clone <repository-url>
   cd <repository-directory>
  
2. **Initialize Terraform**

   Initialize the Terraform configuration to download the necessary providers.
   ```sh
   terraform init
3. **Review the Terraform plan**

   Review the plan to see the resources that will be created.

   ```sh
   terraform plan
4. **Apply the Terraform configuration**

   Apply the configuration to create the resources in Azure.

    ```sh
    terraform apply
  **Note:** Type yes when prompted to confirm the creation of resources

5. **Verify the deployment**

   After the deployment is complete, you can verify the resources in the Azure portal.


   
   
