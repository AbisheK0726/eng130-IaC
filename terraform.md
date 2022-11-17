# Infrastructure as Code - Orchestration with Terraform

## What is Terraform?

Terraform is an open-source infrastructure as code software tool created by HashiCorp. Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language, or optionally JSON.

## Benefits of Terraform

* **Infrastructure as Code** - Terraform codifies cloud APIs into declarative configuration files. Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your data center to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.

* **Execution Plans** - Terraform has a "planning" step where it generates an *execution plan*. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.

* **Resource Graph** - Terraform builds a graph of all your resources, and parallelizes the creation and modification of any non-dependent resources. Because of this, Terraform builds infrastructure as efficiently as possible, and operators get insight into dependencies in their infrastructure.

* **Change Automation** - Complex changesets can be applied to your infrastructure with minimal human interaction

## Terraform Use Cases

* **Provisioning** - Terraform can manage existing and popular service providers as well as custom in-house solutions.

* **Management** - Terraform can manage existing and popular service providers as well as custom in-house solutions.

* **Versioning** - Terraform codifies APIs into declarative configuration files that can be shared amongst team members, treated as code, edited, reviewed, and versioned.

* **Networking** - Terraform can model complex interdependent infrastructure resources.

* **Secrets Management** - Terraform can integrate with a variety of external data sources to pull in information that is sensitive, such as passwords or keys.

## Who uses Terraform?

* **Amazon**
* **Cisco**
* **Docker**
* **Google**
* **Microsoft**
* **Netflix**

## who owns it?

* **HashiCorp** - HashiCorp is a software company that develops open source tools for service discovery, secure configuration, and orchestration. The company's flagship product, Terraform, is a tool for building, changing, and versioning infrastructure safely and efficiently.

## Terraform Installation

Install Chocolatey

```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Install Terraform

```bash
choco install terraform
terraform --version
```

## Terraform Setup

![Terraform-Setup](images/Terraform.png)

### Create a folder called `eng130_terraform` and add the following content

```bash
cd eng130_terraform
nano main.tf
```

### Edit the file `main.tf` and add the following content

Add the provider, in this case we are using AWS

```terraform
provider "aws" {
  region = "eu-west-1"
}
```

### Initialize Terraform

You can use the `terraform init` command to initialize a working directory containing Terraform configuration files.

### Terraform Plan

You can use the `terraform plan` command to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

### Terraform Destroy

You can use the `terraform destroy` command to destroy the Terraform-managed infrastructure.
