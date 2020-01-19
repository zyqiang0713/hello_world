#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

void sig_handler(int signo)
{
  printf("signal accepted");
}

int add(int x, int y){
  return x+y;
}

int main()
{
//  std::cout << "Hello World!" << std::endl;
  int a = 2;
  int b = 5;
  signal(SIGINT, sig_handler);
  printf("hello world!\n");
  printf("start");
 // std::cout << c << std::endl;
  while(1){
    printf("sleep");
    sleep(1);
  }
  return 0;
}
