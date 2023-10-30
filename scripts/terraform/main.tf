resource "kubernetes_manifest" "namespace" {
  manifest = yamldecode(file("${path.module}/../kubernetes/namespace.yaml"))
}

resource "kubernetes_manifest" "pv" {
  depends_on = [kubernetes_manifest.namespace]
  manifest   = yamldecode(file("${path.module}/../kubernetes/pv.yaml"))
}

resource "kubernetes_manifest" "pvc" {
  depends_on = [kubernetes_manifest.pv]
  manifest   = yamldecode(file("${path.module}/../kubernetes/pvc.yaml"))
}

resource "kubernetes_manifest" "webserver" {
  depends_on = [kubernetes_manifest.pvc]
  manifest   = yamldecode(file("${path.module}/../kubernetes/app.yaml"))
}

resource "kubernetes_manifest" "service" {
  depends_on = [kubernetes_manifest.webserver]
  manifest   = yamldecode(file("${path.module}/../kubernetes/service.yaml"))
}
