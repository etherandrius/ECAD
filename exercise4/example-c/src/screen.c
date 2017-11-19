#include "screen.h"

#include "avalon.h"
#include "avalon_addr.h"

	// our pixel format in memory is 5 bits of red, 6 bits of green, 5 bits of blue
	#define PIXEL16(r,g,b) (((r & 0x1F)<<11) | ((g & 0x3F)<<5) | ((b & 0x1F)<<0))
	// ... but for ease of programming we refer to colours in 8/8/8 format and discard the lower bits
	#define PIXEL24(r,g,b) PIXEL16((r>>3), (g>>2), (b>>3))

	#define PIXEL_WHITE PIXEL24(0xFF, 0xFF, 0xFF)
	#define PIXEL_BLACK PIXEL24(0x00, 0x00, 0x00)
	#define PIXEL_RED   PIXEL24(0xFF, 0x00, 0x00)
	#define PIXEL_GREEN PIXEL24(0x00, 0xFF, 0x00)
	#define PIXEL_BLUE  PIXEL24(0x00, 0x00, 0xFF)

	#define DISPLAY_WIDTH	480
	#define DISPLAY_HEIGHT	272

	void vid_set_pixel(int x, int y, int colour)
	{
		// derive a pointer to the framebuffer described as 16 bit integers
		volatile short *framebuffer = (volatile short *) (FRAMEBUFFER_BASE);

		// make sure we don't go past the edge of the screen
		if ((x<0) || (x>DISPLAY_WIDTH-1))
			return;
		if ((y<0) || (y>DISPLAY_HEIGHT-1))
			return;

		framebuffer[x+y*DISPLAY_WIDTH] = colour;
	}
