# Alex's Oracle Cloud Setup

Alex's Oracle Cloud Setup with Terraform all within the free tier

Credits to [@Hiroshi](https://github.com/hi-usui)

## What's included:

- Uses the Root Compartment
- 1 VM.Standard.E2.1.Micro Instance
  - 50GB Boot Volume
  - 50GB Block Volume
- 1 VM.Standard.A1.Flex Instance
  - 50GB Boot Volume
  - 50GB Block Volume
- Some Network + IP configs from Hiroshi

## To use this

Create an Oracle Cloud account. 

Create your public keys in `~/.ssh` by running `TODO`.

Follow [this guide](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm#APIKeyAuth) to find and create your credentials.

Create a `variables.tf` file, copy and uncomment the code from `examples.variables.tf`, fill in the credentials.

Run `terraform init` to initialize the working directory.

Run `terraform plan` to create an execution plan and preview the changes.

Run `terraform apply` to deploy your infrastructure.

`ssh` into your machine.

## Note

The error `500-InternalError, Out of host capacity` means that Oracle is out of A1 instances. You can run `./get-instances.sh` to run a bash script that runs `terraform apply` every 30 seconds to snipe any freed up instances.
