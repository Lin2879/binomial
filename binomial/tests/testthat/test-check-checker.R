context("Check private checker functions")

test_that("check_prob with ok values", {

  expect_true(check_prob(0.5))
  expect_true(check_prob(0))
  expect_true(check_prob(1))
})


test_that("check_prob fails with invalid values", {

  expect_error(check_prob(2))
  expect_error(check_prob(-1))
  expect_error(check_prob(c(0, 0.5, 1)))
})


test_that("check_prob fails with invalid types", {

  expect_error(check_prob('a string'))
})


test_that("check_trials with ok values", {

  expect_true(check_trials(0))
  expect_true(check_trials(10))
  expect_true(check_trials(1:3))
})


test_that("check_trials fails with invalid values", {

  expect_error(check_trials(1.5))
  expect_error(check_trials(-1))
})


test_that("check_trials fails with invalid types", {

  expect_error(check_trials('a string'))
})


test_that("check_success with ok values", {

  expect_true(check_success(1, 5))
  expect_true(check_success(1:3, 5))
  expect_true(check_success(1:5, 5))
})


test_that("check_success fails with invalid values", {

  expect_error(check_success(1.5, 5))
  expect_error(check_success(-1, 5))
  expect_error(check_trials(0:6, 5))
})


test_that("check_success fails with invalid types", {

  expect_error(check_success('a string', 5))
  expect_error(check_success(c('a string', 'another string'), 5))
})
