# Deploy app
resource "helm_release" "pyapp" {
  name       = "pyapp"
  chart      = "${path.module}/charts/monipywdd"
  namespace  = var.kubernetes_namespace
}

# Deploy Datadog agent
resource "helm_release" "ddagent" {
  name       = "ddagent"
  chart      = "${path.module}/charts/ddagent"
  namespace  = var.kubernetes_namespace
}

output "connect_app" {
    value = "POD_NAME=$(kubectl get pods --namespace default -l 'app.kubernetes.io/name=monipywdd,app.kubernetes.io/instance=monipywdd' -o jsonpath='{.items[0].metadata.name}') \nkubectl --namespace default port-forward $POD_NAME 5000:5000 \nhttp://localhost:5000/"
}

output "ddagent_release" {
    value = helm_release.ddagent.metadata
}

output "pyapp_release" {
    value = helm_release.pyapp.metadata
}
