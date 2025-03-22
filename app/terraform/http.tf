provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_manifest" "financing_route" {
  manifest = {
    apiVersion = "gateway.networking.k8s.io/v1"
    kind       = "HTTPRoute"
    metadata = {
      name      = "financing-route"
      namespace = "url"
    }
    spec = {
      parentRefs = [
        {
          group = ""
          kind  = "Service"
          name  = "financing-service"
          port  = 8080
        }
      ]
      rules = [
        {
          matches = [
            {
              path = {
                type  = "PathPrefix"
                value = "/financing"
              }
              headers = [
                {
                  name  = "market"
                  value = "it"
                }
              ]
            }
          ]
          filters = [
            {
              type      = "URLRewrite"
              urlRewrite = {
                path = {
                  type              = "ReplacePrefixMatch"
                  replacePrefixMatch = "/financing-interface"
                }
              }
            }
          ]
          backendRefs = [
            {
              name = "financing-interface"
              port = 8080
            }
          ]
        },
        {
          backendRefs = [
            {
              name = "financing-service"
              port = 8080
            }
          ]
        }
      ]
    }
  }
}
