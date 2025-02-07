module "k8s" {
  source = "../k8s"

  providers = {
    kubernetes = kubernetes
  }

  docker_hub_username = var.docker_hub_username
  docker_hub_password = var.docker_hub_password
  domain  = module.router.endpoint
  name    = var.name
  release = var.release
}

module "api" {
  source = "../../api/gcp"

  providers = {
    google     = google
    kubernetes = kubernetes
  }

  cluster       = var.cluster
  docker_hub_authentication = module.k8s.docker_hub_authentication
  domain        = module.router.endpoint
  image         = var.image
  name          = var.name
  namespace     = module.k8s.namespace
  nodes_account = var.nodes_account
  release       = var.release
  resolver      = module.resolver.endpoint
  router        = module.router.endpoint
  syslog        = var.syslog
}

module "resolver" {
  source = "../../resolver/gcp"

  providers = {
    google     = google
    kubernetes = kubernetes
  }

  docker_hub_authentication = module.k8s.docker_hub_authentication
  image     = var.image
  namespace = module.k8s.namespace
  rack      = var.name
  release   = var.release
}

module "router" {
  source = "../../router/gcp"

  providers = {
    google     = google
    kubernetes = kubernetes
  }

  name      = var.name
  namespace = module.k8s.namespace
  network   = var.network
  release   = var.release
  whitelist = var.whitelist
}
