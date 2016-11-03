#include <stdio.h> 
#include <pthread.h>          
void thread() //新线程执行的函数  
  {     
    int i;    
    for (i=0;i<3;i++)      
    {       
     printf("This is new thread.count= %d .\n",i);         
      sleep(i);       
    }  
  }        
main()      
{          
  pthread_t id;          
  int i,ret;
  ret = pthread_create(&id,NULL,(void *)thread,NULL);//创建新线程       
  if (ret != 0)        
  {           
    printf("Create thread error!\n");           
    exit(1);        
  }         
  for (i=0;i<3;i++)          
  {         
    printf("This is the main thread %d .\n",i);          
    sleep(i);         
  }        
  pthread_join(id,NULL);//等待新线程 id结束  
} 