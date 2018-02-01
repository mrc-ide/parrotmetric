## Don't do this:
## source("R/parrotmetric.R")

## Do this instead:
devtools::load_all()

obj <- parametric_equation(sin, cos, 0, 2 * pi)
xy <- parametric_run(obj, n = 1000)

plot(xy, type = "l", asp = 1)
obj
