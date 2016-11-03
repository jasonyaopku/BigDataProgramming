#include <Rcpp.h>


double rcpp_rootsum_j(Rcpp::NumericVector x)
{
  Rcpp::NumericVector ret = sqrt(x);
  return sum(ret);
}

// [[Rcpp::export]]
Rcpp::NumericVector rcpp_rootsum(Rcpp::NumericMatrix x)
{
  const int nr = x.nrow();
  const int nc = x.ncol();
  Rcpp::NumericVector ret(nc);
  
#pragma omp parallel for shared(x, ret)
  for (int j=0; j<nc; j++)
    ret[j] = rcpp_rootsum_j(x.column(j));
  
  return ret;
}