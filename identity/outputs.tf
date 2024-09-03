output "app" {
  value = var.app
}


output "env" {
  value = var.env
}


output "suffix" {
  value = var.suffix
}


output "app-env" {
  value = "${var.app}-${var.env}"
}


output "app-env-suffix" {
  value = var.suffix == null ? null : "${var.app}-${var.env}-${var.suffix}"
}


output "app-env-path" {
  value = "/${var.app}/${var.env}"
}


output "app-env-suffix-path" {
  value = var.suffix == null ? null : "/${var.app}/${var.env}/${var.suffix}"
}


output "app_env" {
  value = "${var.app}_${var.env}"
}


output "app_env_suffix" {
  value = var.suffix == null ? null : "${var.app}_${var.env}_${var.suffix}"
}


output "appEnv" {
  value = "${var.app}${title(var.env)}"
}


output "appEnvSuffix" {
  value = var.suffix == null ? null : "${var.app}${title(var.env)}${title(var.suffix)}"
}


output "AppEnv" {
  value = "${title(var.app)}${title(var.env)}"
}


output "AppEnvSuffix" {
  value = var.suffix == null ? null : "${title(var.app)}${title(var.env)}${title(var.suffix)}"
}
