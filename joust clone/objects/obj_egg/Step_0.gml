
// sets min and max for x and y speed
yspd = clamp(yspd,-3,2.5)
xspd = clamp(xspd, -maxspd, maxspd)
x += xspd
y += yspd
height = sprite_height/2
width = sprite_width/2

//slows down egg horizontally, slower if touching platform
if xspd >0{
	xspd -= xslow
}else if xspd <0{
	xspd += xslow
}

if grounded = true{
	xslow = .015
}else{
	xslow = .005
}

//gravity
// stops pulling downward when egg reaches bottom
if y < room_height-height {
	yspd += grav
}else{
	yspd = 0
}
if y < height{
	yspd = -yspd*1.5   // bounces egg downward if reach top of screen
}

//loops egg around left and right edge of screen

if x > room_width+width{
	x = 0
}
if x < 0 - width{
		
	x = room_width 
}	

//COLLISIONS
//platforms
if collision_rectangle(x-width,y-height,x+width,y+height,obj_platform,false,false){
	nearPlatform = instance_nearest(x,y,obj_platform) // nearest platform
	if y > nearPlatform.y {
		yspd = -yspd  // bounces player if under platform
	}else if y < nearPlatform.y{
		// grounds player and stops falling downward
		grounded = true	
	}else{
		grounded = false
	}
	
	if x > nearPlatform.x and y> nearPlatform.y-height-1 and y < nearPlatform.y+height+1 {  // bounces player from right or left of platform
		xspd = -xspd
	}else if x < nearPlatform.x and y> nearPlatform.y-height-1 and y < nearPlatform.y+height+1 {
		xspd = -xspd
	}
}else{ // player is no longer grounded on platform
	grounded = false
}

if grounded = true and yspd >0 { // grounds player and prevents downwards motion
	yspd = 0
}
