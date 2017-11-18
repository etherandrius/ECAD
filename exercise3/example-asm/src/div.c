
void div(volatile int N, volatile int D){
  if(D==0)
    return;
  int p = 1;
  do{
    D = D << 1;
    p = p << 1;
  } while(N > D);
  D = D >> 1;
  p = p >> 1;

  int R = 0;
  do{
    if(N>=D){
      N = N - D;
      R = R + p;
    }
    D = D >> 1;
    p = p >> 1;
  } while(p > 0);

  D = N;
  N = R;
}
