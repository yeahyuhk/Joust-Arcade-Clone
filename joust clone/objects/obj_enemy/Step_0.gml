
// sets min and max for x and y speed
yspd = clamp(yspd,-3,2.5)
xspd = clamp(xspd, -maxspd, maxspd)
x += xspd
y += yspd
height = sprite_height/2
width = sprite_width/2

// changes direction variable for sprite
if xspd >0{
	dir = 0
}else if xspd <0{
	dir = 1
}

//MOVEMENT
//
if threat = true{
	xspd += move
}

//flap
if flapTimer <= 0{
	yspd -= flap
	flapTimer = flapTimerMax
}
flapTimer -=1

//gravity
// stops pulling downward when player reaches bottom
if y < room_height-height {
	yspd += grav
}else{
	yspd = 0
}
if y < height{
	yspd = -yspd*1.5  +.5  // bounces player downward when reach top of screen
}



//loops enemy around left and right edge of screen
if threat = true{
	if x-width > room_width{
	    x = 1-width
	}
	if x+width < 0{
	    x = room_width+width-1
	}
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

if myRider.threat = false{
	if threat = true{
		if xspd <= 0{
			instance_create_depth(x-width,y,0,obj_egg)
		}else{
			instance_create_depth(x+width,y,0,obj_egg)
		}
	}
	threat = false
	
}