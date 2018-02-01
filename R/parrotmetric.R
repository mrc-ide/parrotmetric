parametric_equation <- function(x, y, t0, t1) {
  ret <- list(x = x,
              y = y,
              t0 = t0,
              t1 = t1)
  class(ret) <- "parametric_equation"
  ret
}

parametric_run <- function(object, ..., n = 1000) {
  theta <- seq(object$t0, object$t1, length.out = n)
  list(x = object$x(theta, ...),
       y = object$y(theta, ...))
}
