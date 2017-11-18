#include<stdio.h>

void div(int N, int D){
  int p=1;

  while(N > D){
    D = D << 1;
    p = p << 1;
  }
  if(p > 1){
    D = D >> 1;
    p = p >> 1;
  }

  int Q = 0;
  int R = 0;

  while(p > 0){
    if(N>=D){
      N = N - D;
      R = R + p;
    }
    D = D >> 1;
    p = p >> 1;
  }

  // Remiainder = N
  // Division Result = R
}

int main(void){
}
