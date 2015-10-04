set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

d <- knapsack_dynamic(x=knapsack_objects[1:12,],W=3500)

test_that("output class",{
    expect_is(class(d), "list")
})

test_that("number of output",{
    expect_equal(length(d), 2)
})
