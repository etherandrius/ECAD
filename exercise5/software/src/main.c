#include "cycles.h"

int rem(int N, int D){
  if(D==0)
    return -1;
  int p = 1;
  do{
    D = D << 1;
    p = p << 1;
  } while(N >= D);
  D = D >> 1;
  p = p >> 1;
	
  do{
    if(N>=D){
      N = N - D;
    }
    D = D >> 1;
    p = p >> 1;
  } while(p > 0);

	return N;
}


int div(int N, int D){
  if(D==0)
    return -1;
  int p = 1;
  do{
    D = D << 1;
    p = p << 1;
  } while(N >= D);
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

	return R;
}

void hex_output(int value){
	int *hex_leds = (int *) 0x04000080;
	*hex_leds = value;
}

// converts a dec to hex s.t the hex looks like that decimal when printed.
int convert(int dec){
	int base = 0;
	int hex = 0;
	while(dec > 0){
		hex  = hex + (rem(dec, 10) << base);
		dec  = div(dec, 10);
		base = base + 4;
	}
	return hex;
}

int main(void){

  const int second=100;
  const int minute=60*second;
  const int hour  =60*minute;

  while(2){
    int time = div(get_time(), 500000);
    
    // calculating remainders.
    int ms = rem(time, second);
    int s  = rem(time, minute);
    int m  = rem(time, hour);
    
    // isolating values
    m = div(m, minute);
    s = div(s, second);
    
    // convert to hex and shift 
    m = convert(m) << 16;
    s = convert(s) << 8;
    ms= convert(ms);
    int hex_time = m + s + ms;
    hex_output(hex_time);
  }
	return 0;
}

