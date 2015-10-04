context("brute force")

set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

b <- knapsack_dynamic(x=knapsack_objects[1:8,],W=2000)

test_that("output class",{
    expect_is(b$value, "numeric")
    expect_is(b$elements, "numeric")
})

test_that("number of output",{
    expect_equal(length(b), 2)
})

test_that("blackbox",{
    expect_equal(b$value, 15428)
    expect_equal(b$elements, c(3,8))
})