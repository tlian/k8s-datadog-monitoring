# Kubernetes 
variable "kubernetes_namespace" {
  description = "kubernetes namespace where vault will be installed"
  type        = string
  default     = "default"
}