#--------------App-Redis--------------------
data "kubectl_file_documents" "app-redis" {
  content = file("kubernetes/app-redis.yaml")
}

resource "kubectl_manifest" "app-redis" {
  for_each  = data.kubectl_file_documents.app-redis.manifests
  yaml_body = each.value
  depends_on = [
    data.aws_eks_node_group.worker-node-group
  ]
}
#--------------App-CartService--------------------
data "kubectl_file_documents" "app-cartservice" {
  content = file("kubernetes/app-cartservice.yaml")
}
resource "kubectl_manifest" "app-cartservice" {
  for_each  = data.kubectl_file_documents.app-cartservice.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}
#--------------App-CheckoutService--------------------
data "kubectl_file_documents" "app-checkoutservice" {
  content = file("kubernetes/app-checkoutservice.yaml")
}
resource "kubectl_manifest" "app-checkoutservice" {
  for_each  = data.kubectl_file_documents.app-checkoutservice.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}
#--------------App-CurrencyService--------------------
data "kubectl_file_documents" "app-currencyservice" {
  content = file("kubernetes/app-currencyservice.yaml")
}

resource "kubectl_manifest" "app-currencyservice" {
  for_each  = data.kubectl_file_documents.app-currencyservice.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}
#--------------App-EmailService--------------------
data "kubectl_file_documents" "app-emailservice" {
  content = file("kubernetes/app-emailservice.yaml")
}

resource "kubectl_manifest" "app-emailservice" {
  for_each  = data.kubectl_file_documents.app-emailservice.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}
#--------------App-Frontend--------------------
data "kubectl_file_documents" "app-frontend" {
  content = file("kubernetes/app-frontend.yaml")
}

resource "kubectl_manifest" "app-frontend" {
  for_each  = data.kubectl_file_documents.app-frontend.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}
#--------------App-LoadGenerator--------------------
 data "kubectl_file_documents" "app-loadgenerator" {
   content = file("kubernetes/app-loadgenerator.yaml")
 }

 resource "kubectl_manifest" "app-loadgenerator" {
   for_each  = data.kubectl_file_documents.app-loadgenerator.manifests
   yaml_body = each.value
   depends_on = [
     kubectl_manifest.app-redis
   ]
 }

#--------------App-PaymentService--------------------
data "kubectl_file_documents" "app-paymentservice" {
  content = file("kubernetes/app-paymentservice.yaml")
}

resource "kubectl_manifest" "app-paymentservice" {
  for_each  = data.kubectl_file_documents.app-paymentservice.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}
#--------------App-ProductcatalogService--------------------
data "kubectl_file_documents" "app-productcatalogservice" {
  content = file("kubernetes/app-productcatalogservice.yaml")
}

resource "kubectl_manifest" "app-productcatalogservice" {
  for_each  = data.kubectl_file_documents.app-productcatalogservice.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}
#--------------App-RecommendationService--------------------
data "kubectl_file_documents" "app-recommendationservice" {
  content = file("kubernetes/app-recommendationservice.yaml")
}

resource "kubectl_manifest" "app-recommendationservice" {
  for_each  = data.kubectl_file_documents.app-recommendationservice.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}
#--------------App-ShippingService--------------------
data "kubectl_file_documents" "app-shippingservice" {
  content = file("kubernetes/app-shippingservice.yaml")
}

resource "kubectl_manifest" "app-shippingservice" {
  for_each  = data.kubectl_file_documents.app-shippingservice.manifests
  yaml_body = each.value
  depends_on = [
    kubectl_manifest.app-redis
  ]
}