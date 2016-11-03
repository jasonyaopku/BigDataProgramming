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
}
user_sim = cosine(t(user_item_mat));
cosine(as.vector(user_item_mat[1,]) ,as.vector(user_item_mat[2,]));
cor(t(user_item_mat),method = "pearson")

#recommend for user i
i=7;
sim_vec_i = user_sim[,i]
weight_mat = sim_vec_i*user_item_mat;
sum_weight_mat = apply(weight_mat,MARGIN = 2, sum);
sum_sim_mat = apply(sim_vec_i*(user_item_mat>0), MARGIN = 2, sum);

predict_rate = sum_weight_mat[user_item_mat[i,]==0]/sum_sim_mat[user_item_mat[i,]==0]



