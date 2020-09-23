# Deploy app
resource "helm_release" "dotnetapp" {
  name       = "dotnetapp"
  chart      = "${path.module}/charts/monidotnetwdd"
  namespace  = var.kubernetes_namespace
}

# Deploy Datadog agent
resource "helm_release" "ddagent" {
  name       = "ddagent"
  chart      = "${path.module}/charts/ddagent"
  namespace  = var.kubernetes_namespace
}

output "ddagent_release" {
    value = helm_release.ddagent.metadata
}

output "dotnetapp_release" {
    value = helm_release.dotnetapp.metadata
}