output "service_url" {
  description = "Service urls."

  value = "${var.enable_lb ?
    lower(join(",", formatlist(
        "%s://%s:%s",
        aws_alb_listener.main.*.protocol,
        element(concat(aws_alb.main.*.dns_name, list("")), 0),
        aws_alb_listener.main.*.port
    ))) : ""}"
}
