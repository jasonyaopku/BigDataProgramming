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












useritem.dataframe = data.frame(user_item_mat)
colnames(useritem.dataframe) = c("Titanic","Batman","Inception","Superman","Spiderman","Matrix");
rownames(useritem.dataframe) = c("Michele","Satya","Pranav","Suresh","Tom","Leo","Chan");
item_sim = cosine(user_item_mat);
rownames(item_sim) = colnames(item_sim) = c("Titanic","Batman","Inception","Superman","Spiderman","Matrix");

rec_itm_for_user = function(userno,ratings)
{
  userRatings = ratings[userno,]
  non_rated_movies = list()
  rated_movies = list()
  for(i in 1:length(userRatings)){
    if((userRatings[i])==0)
    {
      non_rated_movies = c(non_rated_movies,colnames(userRatings)[i])
    }
    else
    {
      rated_movies = c(rated_movies,colnames(userRatings)[i])
    }
  }
  non_rated_movies = unlist(non_rated_movies)
  rated_movies = unlist(rated_movies)
  #create weighted similarity for all the rated movies by CHAN
  non_rated_pred_score = list()
  for(j in 1:length(non_rated_movies)){
    temp_sum = 0
    df = item_sim[which(rownames(item_sim)==non_rated_movies[j]),]
    for(i in 1:length(rated_movies)){
      temp_sum = temp_sum+ df[which(names(df)==rated_movies[i])]
    }
    weight_mat = df*ratings[userno,1:6]
    non_rated_pred_score = c(non_rated_pred_score,rowSums(weight_mat,na.rm=T)/temp_sum)
  }
  pred_rat_mat = as.data.frame(non_rated_pred_score)
  names(pred_rat_mat) = non_rated_movies
  sorted_rate = sort(pred_rat_mat[1,],decreasing = TRUE);
  
  for(k in 1:ncol(pred_rat_mat)){
    ratings[userno,][which(names(ratings[userno,]) == names(pred_rat_mat)[k])] = pred_rat_mat[1,k]
  }
  return(ratings[userno,])
}

rec_itm_for_user(7,useritem.dataframe)
