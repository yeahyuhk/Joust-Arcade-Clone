/// @description Insert description here
// You can write your code in this editor

if room == game{
	//draws score counter
	draw_set_halign(fa_left)
	draw_text(x,y,global.SCORE)
	
	//draws level counter
	draw_set_halign(fa_center)
	draw_text(140,225,"Level " + string(global.LEVEL))

	// draws squares to show  number of lives
	for (i = 0; i <= global.LIVES; i += 1){
		draw_rectangle(x+50-3+(i*10),y,x+50+3+(i*10),y+5,false)
	}
}

//final score on gmae over
if room == endscreen{
	draw_set_halign(fa_center)
	draw_text(x,y-15,"Score:")
	draw_text(x,y,global.SCORE)
}