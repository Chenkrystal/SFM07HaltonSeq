# SFM07HaltonSeq
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **SMF07HaltonSeq** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : SMF07HaltonSeq
Published in : Statistics of Financial Markets 

Description : 'Simulate n random numbers with base b between 0 and 1 using Halton sequence.'

Keywords : simulation, base, halton sequence, random number

Author : ZhangKaiqi, GuoLiu, ZengLi, NiePei

Submitted : Mon, July 18 2016 by SFM.Group07

Input: 
- b : Base
- n : The number of random numbers with base b

Output:  n random numbers between 0 and 1 with base b

```
# R code
```r
# clear variables and close windows
rm(list = ls(all = TRUE))
graphics.off()

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

```

# MATLAB code
```matlab

function hs = haltontotal(n,b)
hs = zeros(n,1);
for i = 1:n
    hs(i) = HaltonSingle(i,b);
end

% Subfunction to generate the nth number in Halton's sequence
function hn = HaltonSingle(n,b)
% This function generates the n-th number in Halton's low
% discrepancy sequence.
n0 = n;
hn = 0;
f = 1/b;
while (n0>0)
    n1 = floor(n0/b);
    r = n0-n1*b;
    hn = hn + f*r;
    f = f/b;
    n0 = n1;
end 
