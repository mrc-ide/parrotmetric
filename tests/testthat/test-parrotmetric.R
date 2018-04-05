context("parrotmetric")

test_that("construction", {
  f <- parametric_equation(sin, cos, 0, 2 * pi)
  expect_is(f, "parametric_equation")
})


test_that("invalid input", {
  expect_error(parametric_equation(0:10, runif(10), 0, 2 * pi),
               "be a function")
})


test_that("parametric run", {
  f <- parametric_equation(sin, cos, 0, 2 * pi)
  res <- parametric_run(f, n = 20)

  expect_is(res, "list")
  expect_equal(names(res), c("x", "y"))
  expect_equal(length(res$x), 20)
  expect_equal(length(res$y), 20)

  expect_equal(res$x, sin(seq(0, 2 * pi, length.out = 20)))
  expect_equal(res$y, cos(seq(0, 2 * pi, length.out = 20)))
})


test_that("assert_function", {
  expect_silent(assert_function(sin))
  expect_error(assert_function(pi, "Expected 'pi' to be a function"))
})
