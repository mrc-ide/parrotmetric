#' Construct a parametric equation object
#'
#' Description goes here.
#'
#' @title This is a title
#'
#' @param x Functions representing the x values in terms of t.
#' @param y Functions representing the y values in terms of t.
#' @param t0 The initial value of t
#' @param t1 The final value of t
#'
#' @section Beware!:
#'
#' Don't use this function for mission critical things.
#'
#' @return An object of \code{parametric_equation}
#' @export
#' @examples
#' # construct a parametric equation object
#' \dontrun{
#' obj <- parametric_equation(sin, cos, 0, 2 * pi)
#' obj
#' }
#'
#' # See .... for ways of using it
#' @seealso See \code{\link{median}} for something totally different
parametric_equation <- function(x, y, t0, t1) {
  assert_function(x)
  assert_function(y)
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


assert_function <- function(x, name = deparse(substitute(x))) {
  if (!is.function(x)) {
    stop(sprintf("Expected '%s' to be a function", name))
  }
}
