context("Check private auxiliary functions")

test_that("aux_mean with ok values", {

  expect_true(aux_mean(10, 0.3) == 3)
  expect_true(aux_mean(2, 0.5) == 1)
})


test_that("aux_mean fails with invalid types",{

  expect_error(aux_mean('a string', 'another string'))
  expect_error(aux_mean('a string', 0.5))
  expect_error(aux_mean(10, 'a string'))
})


test_that("aux_variance with ok values", {

  expect_true(aux_variance(2, 0.5) == 0.5)
})


test_that("aux_variance fails with invalid types",{

  expect_error(aux_variance('a string', 'another string'))
  expect_error(aux_variance('a string', 0.5))
  expect_error(aux_variance(10, 'a string'))
})


test_that("aux_mode with ok values", {

  expect_true(aux_mode(10, 0.3) == 3)
  expect_true(aux_mode(2, 0.5) == 1)
})


test_that("aux_mode fails with invalid types",{

  expect_error(aux_mode('a string', 'another string'))
  expect_error(aux_mode('a string', 0.5))
  expect_error(aux_mode(10, 'a string'))
})


test_that("aux_skewness with ok values", {

  expect_true(aux_skewness(2, 0.5) == 0)
})


test_that("aux_skewness fails with invalid types",{

  expect_error(aux_skewness('a string', 'another string'))
  expect_error(aux_skewness('a string', 0.5))
  expect_error(aux_skewness(10, 'a string'))
})


test_that("aux_kurtosis with ok values", {

  expect_true(aux_kurtosis(2, 0.5) == -1)
})


test_that("aux_kurtosis fails with invalid types",{

  expect_error(aux_kurtosis('a string', 'another string'))
  expect_error(aux_kurtosis('a string', 0.5))
  expect_error(aux_kurtosis(10, 'a string'))
})

