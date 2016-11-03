#include <stdio.h>   
#include <pthread.h>   
#define MAX 10  
int i,value = 0;  


void func1( )  
{  
  printf("thread1 open!\n"); 
  for (i = 0; i < MAX; i++)
  {   
    value ++;  
    printf("value1= %d!\n", value);  
    //sleep(1); //去掉这句会如何？
  }  
}  
void func2( )  
{  
  printf("thread2 open!\n");  
  for (i = 0; i < MAX; i++)
  {  
    value ++;  
    printf("value2= %d!\n", value);  
    //sleep(1);   //去掉这句会如何？
  }  
}  
main()  
{  
  pthread_t pid1, pid2;  
  
  
  if(pthread_create(&pid1, NULL, (void *)func1, NULL))  
  {  
    printf("Thread1 create error\n");  
  }  
  
  if(pthread_create(&pid2, NULL,(void *) func2, NULL))  
  {  
    printf("Thread2 create error\n");   
  }  
  pthread_join(pid1,NULL);
  pthread_join(pid2,NULL);
}  