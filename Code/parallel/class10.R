install.packages("snowfall")
library(snowfall)
library(parallel)

myfunction = function(x)
{
  datafile = x;
  data = read.csv(file=paste0(x,".csv"));
  data$one = rep(1,nrow(data))
  caixi.num = aggregate(formula = one~category,data=data,FUN = sum);
  caixi.junjia = aggregate(formula = consumPtion~category,data=data,FUN = mean);
  result = cbind(caixi.num,caixi.junjia[,2])
  return(result);
}
cities = c("beijing","shanghai");
citymat = matrix(cities,2,1);
x=citymat[1,]
cpus = detectCores();
sfInit(parallel = TRUE,cpus = cpus);
allresult = sfApply(citymat,1,myfunction)
sfStop();

