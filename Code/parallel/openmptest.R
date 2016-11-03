library(Rcpp)

Sys.setenv("PKG_CXXFLAGS"="-fopenmp")
sourceCpp(file="rootsum.cpp")

m <- 100
n <- 5000
x <- matrix(runif(m*n), m, n)
all.equal(rcpp_rootsum(x), colSums(sqrt(x)))