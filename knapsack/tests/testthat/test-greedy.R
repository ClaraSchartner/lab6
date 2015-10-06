context("greedy")

set.seed(42)
n <- 2000
knapsack_objects <-data.frame(w=sample(1:4000, size = n, replace = TRUE),v=runif(n = n, 0, 10000))

g <- greedy_knapsack(x=knapsack_objects[1:800,],W=3500)

test_that("output class",{
    expect_is(g$value, "numeric")
    expect_is(g$elements, "numeric")
})

test_that("number of output",{
    expect_equal(length(g), 2)
})

test_that("blackbox",{
    #expect_equal(g$value, 195497)
    expect_equal(g$elements, c(92,574,472,80,110,537,332,117,37,776,577,288,234,255,500,794,55,
                               290,436,346,282,764,599,303,345,300,243,43,747,35,77,229,719,564,400))
})