library(parallel)
index <- 1:1e5
system.time(lapply(index, sqrt))

system.time(mclapply(index, sqrt, mc.cores=2))
system.time(mclapply(index, sqrt, mc.cores=4))



sapply(1:100, fizzbuzz)
mclapply(1:100, fizzbuzz, mc.cores=4)
system.time(sapply(1:1000, fizzbuzz))

system.time(mclapply(1:1000, fizzbuzz, mc.cores=4))

fizzbuzz = function(i)
{
  if (i%%15==0)
  {
    for(i in 1:1000000)
    {
      a=0;#do nothing
    }
    "fizzbuzz" 
  }
  else if (i%%3==0)
    "fizz"
  else if (i%%5 == 0)
    "buzz"
  else
    i
}

sapply(1:100, fb) %>% head()