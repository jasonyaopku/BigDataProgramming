#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>  
#include <pthread.h>          
void printid(char *s)//各线程共享的函数  
    {    
      pid_t pid;    
      pthread_t tid;
      pid=getpid();
      tid=pthread_self();    
      printf("%s pid= %d, tid=%d .\n",s,pid, tid); 
      sleep(2);
      printf("%s function is over!\n",s);
      } 
void thread_fun(char *s )//新线程执行的函数
{
  printid(s);
}          
int main()      
{          
pthread_t tid;         
int ret;  
ret = pthread_create(&tid,NULL,(void *)thread_fun,"我是新线程："); 
sleep(2);
if (ret != 0)        
{          
  printf("Create thread error!\n");          
  exit(1);        
  }        
printid("我是主线程：");         
sleep(2); //挂起2秒，等待新线程结束             
} 
    
    