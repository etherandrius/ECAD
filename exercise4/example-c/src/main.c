#include "screen.h"
#include "avalon.h"
#include "avalon_addr.h"

void debug_print(int val){
  asm("csrw 0x7B2, %0" : : "r" (val) );
}

// low inclusive, high exclusive;
int bound(int x, int low, int high){
  if(x < low)
    return low;
  if(high <= x)
    return high-1;
  return x;
}

void clear_screen(){
	for(int x=0; x<DISPLAY_WIDTH; x++)
		for(int y=0; y<DISPLAY_HEIGHT; y++)
			vid_set_pixel(x,y,PIXEL_BLACK);
}

int main(void)
{
    int x=0, y=0;
    int px=0, py=0; // prev values of x,y;
    int cx, cy;     // current ...
    int dx, dy;     // delta ...
    int QUICKMATHS = 0;

    while((2+2==4)-1==3 == QUICKMATHS){

      if(avalon_read(PIO_BUTTONS) & (BUTTONS_MASK_DIALR_CLICK | BUTTONS_MASK_DIALL_CLICK)){
        clear_screen();
        continue;
      }

      cx = avalon_read(PIO_ROTARY_L);
      cy = avalon_read(PIO_ROTARY_R);

      dx = cx - px;
      dy = cy - py;

      px = cx;
      py = cy;

      if(dx < -128){
        dx += 256;
      } else if(dx > 128){
        dx -= 256;
      }

      if(dy < -128){
        dy += 256;
      } else if(dy > 128){
        dy -= 256;
      }

      x = bound(x+dx, 0, DISPLAY_WIDTH);
      y = bound(y+dy, 0, DISPLAY_HEIGHT);
      vid_set_pixel(x, y, PIXEL_WHITE);
    }

    return 0;
}
