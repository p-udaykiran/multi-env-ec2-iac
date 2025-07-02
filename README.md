<h1 align="center">🚀 Multi-Environment AWS Infrastructure using Terraform.</h1>

<hr>

<h2>📘 Project Overview</h2>

<p>
  This project automates the provisioning of AWS infrastructure using <strong>Terraform</strong>. 
  The infrastructure supports three environments: <code>dev</code>, <code>stage</code>, and <code>prod</code>, allowing you to manage multiple isolated setups with consistent configurations.
</p>

<hr>

<h2>🛠️ What We Built</h2>

<ul>
  <li><strong>EC2 Instances</strong>: Virtual machines with SSH access, user data, and custom tags</li>
  <li><strong>S3 Buckets</strong>: Environment-based object storage with lifecycle tags</li>
  <li><strong>DynamoDB Tables</strong>: Used as demo state tables (optionally lock state)</li>
  <li><strong>Security Groups</strong>: Allows SSH, HTTP, and HTTPS traffic</li>
  <li><strong>Key Pairs</strong>: Used to SSH into EC2 instances securely</li>
  <li><strong>Default VPC</strong>: Leveraged default networking setup for simplicity</li>
</ul>

<hr>

<h2>🌱 Environments Supported</h2>

<table border="1" cellspacing="0" cellpadding="8">
  <tr>
    <th>Environment</th>
    <th>Purpose</th>
  </tr>
  <tr>
    <td>Dev</td>
    <td>Developer experiments and testing</td>
  </tr>
  <tr>
    <td>Stage</td>
    <td>Pre-production validation</td>
  </tr>
  <tr>
    <td>Prod</td>
    <td>Live production workloads</td>
  </tr>
</table>

<hr>

<h2>📦 Prerequisites & Usage</h2>

<ul>
  <li>Install Terraform</li>
  <li>Ensure your AWS credentials are configured (via <code>aws configure</code> or environment variables)</li>
  <li>Generate SSH key (if not already)</li>
</ul>

<pre><code>ssh-keygen -t rsa -b 4096 -f infra_key</code></pre>

<h4>➡️ Run the following commands to set up your infrastructure:</h4>

<pre><code>
git clone https://github.com/p-udaykiran/multi-env-ec2-iac.git
cd terraform_app-module

# Initialize
terraform init

# (Optional) Validate your configuration
terraform validate

# Plan the changes
terraform plan

# Apply the infrastructure
terraform apply

# Destroy the environment (optional)
terraform destroy
</code></pre>

<hr>

<h2>📁 Directory Structure</h2>

<pre>
terraform_app-module/
├── infra-app/
│   ├── ec2.tf
│   ├── s3.tf
│   ├── dynamodb.tf
│   ├── variable.tf
│   └── nginx.sh
├── main.tf
├── provider.tf
├── terraform.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── infra_key
└── infra_key.pub
</pre>

<hr>

<h2>✅ Highlights</h2>

<ul>
  <li>Environment-aware deployment using <code>terraform workspace</code></li>
  <li>Reusable modules for clean separation of concerns</li>
  <li>Custom EC2 configuration using <code>user_data</code></li>
  <li>Secure SSH key pair handling</li>
  <li>Logical resource tagging based on <code>var.env</code></li>
</ul>

<hr>

<h2>📌 Commands Reference</h2>

<ul>
  <li>List workspaces: <code>terraform workspace list</code></li>
  <li>Target specific resource: <code>terraform apply -target=aws_vpc.default</code></li>
  <li>Destroy specific env: <code>terraform destroy -target=module.dev-infra</code></li>
</ul>

<hr>

<h2>📷 Demo Screenshot</h2>

<p align="center">
  <img src="infra-app/img/Screenshot%20from%202025-07-03%2002-53-38.png" alt="Terraform EC2 Screenshot" width="600">
  <br><br>
  <img src="infra-app/img/Screenshot%20from%202025-07-03%2003-28-03.png" alt="Terraform EC2 Console Output" width="600">
</p>

<hr>

<h2>👨‍💻 Author</h2>
<p><strong>Uday Kiran</strong> — Cloud/DevOps Enthusiast 🌩️</p>

<p>📫 GitHub: <a href="https://github.com/p-udaykiran">p-udaykiran</a></p>


<hr>
