resource "kubectl_manifest" "namespace" {
  yaml_body = file("${path.module}/../kubernetes/namespace.yaml") 
}

resource "kubectl_manifest" "pv" {
  depends_on = [kubectl_manifest.namespace]
  yaml_body  = file("${path.module}/../kubernetes/pv.yaml") 
}

resource "kubectl_manifest" "pvc" {
  depends_on = [kubectl_manifest.pv]
  yaml_body  = file("${path.module}/../kubernetes/pvc.yaml")
}

resource "kubectl_manifest" "webserver" {
  depends_on = [kubectl_manifest.pvc]
  yaml_body  = file("${path.module}/../kubernetes/app.yaml")
}

resource "kubectl_manifest" "service" {
  depends_on = [kubectl_manifest.webserver]
  yaml_body  = file("${path.module}/../kubernetes/service.yaml")
}
