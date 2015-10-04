context("dynamic")

set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

d <- knapsack_dynamic(x=knapsack_objects[1:8,],W=2000)

test_that("output class",{
    expect_is(d$value, "numeric")
    expect_is(d$elements, "numeric")
})

test_that("number of output",{
    expect_equal(length(d), 2)
})

test_that("blackbox",{
    expect_equal(d$value, 15428)
    expect_equal(d$elements, c(3,8))
})