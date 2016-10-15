#install.packages("lsa")
library(lsa)
user_item_data = c(2.5,3.5,3,3.5,2.5,3,
                   3,3.5,1.5,5,3,3.5,
                   2.5,3,NA,3.5,NA,4,
                   NA,3.5,3,4,2.5,4.5,
                   3,4,2,3,2,3,
                   3,4,NA,5,3.5,3,
                   NA,4.5,NA,4,1,NA);
user_item_data[is.na(user_item_data)]=0;
user_item_mat = matrix(user_item_data,nrow = 7,ncol=6,byrow = TRUE)
cosine_fun = function(vec1,vec2)
{
  res = sum(vec1*vec2)/(sqrt(sum(vec1*vec1))*sqrt(sum(vec2*vec2)));
  return(res)
}

vec1 = as.vector( user_item_mat[7,]);
vec2 = as.vector(user_item_mat[5,]);
cosine_fun(vec1,vec2 )
