src = c(1,1,1,2,2,3,4);
dist = c(2,3,4,3,4,4,2);
pages = data.frame(src = src,dist=dist);

#构建邻接矩阵
adjacencyMatrix = function(pages)
{
  n = max(apply(pages,2,max))
  A = matrix(0,n,n)
  for(i in 1:nrow(pages)) 
    {
      A[pages[i,]$dist,pages[i,]$src]<-1
    }
  A
}

#变换概率矩阵
probabilityMatrix = function(A)
{
  cs = colSums(A)
  cs[cs==0] = 1
  n = nrow(A)
  G = matrix(0,nrow(A),ncol(A))
  for (i in 1:n) 
    {
      G[i,] = G[i,] + A[i,]/cs
    }
  G
}

#递归计算矩阵特征值
eigenMatrix = function(G,iter=10)
{
  
  n = nrow(G)
  x = rep(1,n)
  for (i in 1:iter) 
  {
    x = G %*% x;
  }
  x/sum(x)
}

A = adjacencyMatrix(pages)
A
G = probabilityMatrix(A)
G
PR = eigenMatrix(G,10)
PR


#变换概率矩阵,考虑d的情况
dProbabilityMatrix = function(A,d=0.85)
{
  cs = colSums(A)
  cs[cs==0] = 1
  n = nrow(A)
  delta = (1-d)/n
  G = matrix(delta,nrow(A),ncol(A))
  for (i in 1:n) 
  {
    G[i,] = G[i,] + d*A[i,]/cs;
  }
  G
}

dG = dProbabilityMatrix(A)
dG
dPR = eigenMatrix(G,10)
dPR
