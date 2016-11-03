#include <stdio.h> 
#include<pthread.h> 
#define MAX 10
int i,value = 0;


void func1( ) 
{ 
  for (i = 0; i < MAX; i++)
  {  
    
        printf(“thread1 open!”); 
    
    value ++; 
    printf("value1= %d!\n", value); 
        sleep(1); //去掉这句会如何？
     
  } 
} 