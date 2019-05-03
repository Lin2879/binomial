context("Check public binomial functions")

test_that("bin_choose with ok values", {

  expect_true(bin_choose(5, 1) == 5)
  expect_true(sum(bin_choose(5, 1:3) == c(5, 10, 10)) == 3)
})


test_that("bin_choose fails with invalid values", {

  expect_error(bin_choose(5, 6))
  expect_error(bin_choose(5, 2:10))
})


test_that("bin_choose fails with invalid types", {

  expect_error(bin_choose(5, 'a string'))
  expect_error(bin_choose(5, c('a string', 'another string')))
})


test_that("bin_probability with ok values", {

  expect_true(bin_probability(3, 5, 0.5) == 0.3125)
  expect_true(bin_probability(5, 5, 1) == 1)
})


test_that("bin_probability fails with invalid values", {

  expect_error(bin_probability(10, 5, 0.5))
  expect_error(bin_probability(3, 5, -1))
  expect_error(bin_probability(-2, 5, 0.5))
  expect_error(bin_probability(1, -1, 0.5))
  expect_error(bin_probability(1, 1.5, 0.5))
  expect_error(bin_probability(3.5, 5, 0.5))
})


test_that("bin_probability fails with invalid types", {

  expect_error(bin_probability('a string', 0.5))
  expect_error(bin_probability(1, 'a string'))
  expect_error(bin_probability(c('a string', 'another string'), 5, 0.5))
})


test_that("bin_distribution fails with invalid values", {

  expect_error(bin_distribution(10, 5))
  expect_error(bin_distribution(3, -1))
  expect_error(bin_distribution(-2, 0.5))
  expect_error(bin_distribution(1.5, 0.5))
})


test_that("bin_distribution fails with invalid types", {

  expect_error(bin_distribution('a string', 0.5))
  expect_error(bin_distribution(5, 'a string'))
  expect_error(bin_distribution(c('a string', 'another string'), 0.5))
})


test_that("bin_cumulative fails with invalid values", {

  expect_error(bin_cumulative(10, 5))
  expect_error(bin_cumulative(3, -1))
  expect_error(bin_cumulative(-2, 0.5))
  expect_error(bin_cumulative(1.5, 0.5))
})


test_that("bin_cumulative fails with invalid types", {

  expect_error(bin_cumulative('a string', 0.5))
  expect_error(bin_cumulative(5, 'a string'))
  expect_error(bin_cumulative(c('a string', 'another string'), 0.5))
})
