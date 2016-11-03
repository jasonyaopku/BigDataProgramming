#example1
mysort <- function(x){
  replicate(5, sort(x))
  return(sort(x)[1:10])
}
M = matrix(rnorm(10000000), 100, 100000)
print('sequence run:')
print(system.time(x<-apply(M, 2, mysort)))


#example2
#install.packages("snowfall")
library("snow")
library("snowfall")
library("parallel")
mysort <- function(x)
{
  replicate(5, sort(x))
  return(sort(x)[1:10])
}
M = matrix(rnorm(10000000), 100, 100000)
cpus= detectCores ();
sfInit(parallel=TRUE, cpus=cpus)
print(sprintf('%s cpus to be used', sfCpus()))
print('parallel time cost:')
print(system.time(x<-sfApply(M, 2, mysort)))
sfStop()


#example3
mysort <- function(x){
  replicate(5, sort(x))
  message(msg);
  return(sort(x)[1:10])
}
M = matrix(rnorm(10000000), 100, 100000)
msg ="Hello parallel";
print('sequence run:')
print(system.time(x<-apply(M, 2, mysort)))


#example4
mysort <- function(x)
{
  replicate(5, sort(x))
  message(msg);
  return(sort(x)[1:10])
}
M = matrix(rnorm(10000000), 100, 100000)
msg ="Hello parallel";
cpus= detectCores ();
sfInit(parallel=TRUE, cpus=cpus)
print(sprintf('%s cpus to be used', sfCpus()))
print('parallel time cost:')
print(system.time(x<-sfApply(M, 2, mysort)))
sfStop()


#example5
mysort <- function(x)
{
  replicate(5, sort(x))
  message(msg);
  return(sort(x)[1:10])
}
M = matrix(rnorm(10000000), 100, 100000)
msg ="Hello parallel";
cpus= detectCores ();
sfInit(parallel=TRUE, cpus=cpus)
sfExport("msg");
print(sprintf('%s cpus to be used', sfCpus()))
print('parallel time cost:')
print(system.time(x<-sfApply(M, 2, mysort)))
sfStop()


#example6
library("taRifx")
mysort <- function(x){
  replicate(5, sort(x))
  x=c(1,2,3); y=c(2,3,1); fm = data.frame(x,y);
  sort.data.frame(fm,formula=~y);
  return(sort(x)[1:5])
}
M = matrix(rnorm(100), 10, 10)
print('sequence run:')
print(system.time(x<-apply(M, 2, mysort)))

#example7
library("taRifx")
mysort <- function(x){
  replicate(5, sort(x))
  x=c(1,2,3); y=c(2,3,1); fm = data.frame(x,y);
  sort.data.frame(fm,formula=~y);
  return(sort(x)[1:10])
}
M = matrix(rnorm(10000000), 100, 100000)
cpus= detectCores ();
sfInit(parallel=TRUE, cpus=cpus)
print(sprintf('%s cpus to be used', sfCpus()))
print('parallel time cost:')
print(system.time(x<-sfApply(M, 2, mysort)))
sfStop()

#example8
library("taRifx")
mysort <- function(x){
  replicate(5, sort(x))
  x=c(1,2,3); y=c(2,3,1); fm = data.frame(x,y);
  sort.data.frame(fm,formula=~y);
  return(sort(x)[1:10])
}
M = matrix(rnorm(10000000), 100, 100000)
cpus= detectCores ();
sfInit(parallel=TRUE, cpus=cpus)
sfLibrary(taRifx);
print(sprintf('%s cpus to be used', sfCpus()))
print('parallel time cost:')
print(system.time(x<-sfApply(M, 2, mysort)))
sfStop()