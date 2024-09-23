# Define a variable for the application name
variable "app_name" {
  default = "pritprojectpart4"  # The default value for the app name is "manishprojectpart4"
}

# Define a variable for the Azure location (region) where resources will be deployed
variable "location" {
  default = "australiasoutheast"  # The default region for resources is set to "Australia Southeast"
}

# Define a variable for the Kubernetes version to be used in the AKS cluster
variable "kubernetes_version" {
  default = "1.30.2"  # The default Kubernetes version for the AKS cluster is set to "1.30.2"
}
