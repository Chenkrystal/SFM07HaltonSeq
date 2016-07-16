# Subfunction to generate the nth number in Halton's sequence
localHaltonSingleNumber <- function(n, b) {
    n0 <- n
    hn <- 0
    f <- 1/b
    while (n0 > 0) {
        n1 <- floor(n0/b)
        r <- n0 - n1 * b
        hn <- hn + f * r
        f <- f/b
        n0 <- n1
    }
    hn
}

# A example of simulation using Halton Sequence which generates the nth number with base b
localHaltonSingleNumber(5, 2)

# Function to generate the first n numbers in Halton's low discrepancy sequence with base b
HaltonSequence <- function(n, b) {
    hs <- rep(0, n)
    for (i in 1:n) {
        hs[i] <- localHaltonSingleNumber(i, b)
    }
    hs
}

# A example of simulation using Halton Sequence which generates n numbers with base b
HaltonSequence(5, 2)
