set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

g <- greedy_knapsack(x=knapsack_objects[1:500,],W=3500)

test_that("output class",{
    expect_is(class(g), "list")
})

test_that("number of output",{
    expect_equal(length(g), 2)
})

test_that("blackbox",{
    expect_equal(g$value, 161423)
    expect_equal(g$elements, c(449, 112, 279, 238, 485, 220, 375, 334, 314, 482, 127, 98,
                               140, 405, 204, 320, 72, 211, 299, 444, 89, 142, 379))
})