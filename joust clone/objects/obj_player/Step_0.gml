
// sets min and max for x and y speed
yspd = clamp(yspd,-3,3)
xspd = clamp(xspd, -3,3)
x += xspd
y += yspd

// changes direction variable for sprite
if xspd >0{
	dir = 0
}else if xspd <0{
	dir = 1
}

//MOVEMENT
//gravity
// stops pulling downward when player reaches bottom
if y < room_height-height {
	yspd += grav
}else{
	yspd = 0
}
if y < height{
	yspd = -yspd*1.5   // bounces player downward when reach top of screen
}

//loops player around left and right edge of screen
if x > room_width{
    x = 0
}
if x < 0{
    x = room_width
}


// PLAYER CONTROLS 
// space bar = flap = increases y speed upwards
if alive{
	if keyboard_check_pressed(vk_space){
		yspd -= flap
		grounded = false
	}
	// left and right controls
	if keyboard_check(vk_left){
		xspd -= move	
	}
	if keyboard_check(vk_right){
		xspd += move	
	}
}

//COLLISIONS
//platforms
if collision_rectangle(x-width,y-height,x+width,y+height,obj_platform,false,false){
	nearPlatform = instance_nearest(x,y,obj_platform) // nearest platform
	if y > nearPlatform.y{
		yspd = -yspd  // bounces player if under platform
	}
	if y < nearPlatform.y { // grounds player and stops falling downward
		grounded = true	
	}else{
		grounded = false
	}
	
	if x > nearPlatform.x and y> nearPlatform.y-height and y < nearPlatform.y+height {  // bounces player from right or left of platform
		xspd = -xspd
	}
	if x < nearPlatform.x and y> nearPlatform.y-height and y < nearPlatform.y+height {
		xspd = -xspd
	}
}else{ // player is no longer grounded on platform
	grounded = false
}

if grounded = true and yspd >0 { // grounds player and prevents downwards motion
	yspd = 0
}