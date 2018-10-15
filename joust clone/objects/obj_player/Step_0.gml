
// sets min and max for x and y speed
yspd = clamp(yspd,-3,2.5)
xspd = clamp(xspd, -3,3)
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
//gravity
// stops pulling downward when player reaches bottom
if alive{
	if y < room_height-height {
		yspd += grav
	}else{
		yspd = 0
	}
	if y < height{
		yspd = -yspd*1.5   // bounces player downward when reach top of screen
	}

	//loops player around left and right edge of screen
	if x-width > room_width{
	    x = 1-width
	}
	if x+width < 0{
	    x = room_width+width-1
	}


	// PLAYER CONTROLS 
	// space bar = flap = increases y speed upwards

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
	
	//COLLISIONS
	//platforms
	nearPlatform = instance_nearest(x,y,obj_platform) // nearest platform
	if collision_rectangle(x-width,y-height,x+width,y+height,nearPlatform,false,false){
		if y > nearPlatform.y  {
			yspd = -yspd  // bounces player if under platform
		}else if y < nearPlatform.y{
			// grounds player and stops falling downward
			grounded = true	
		}else{
			grounded = false
		}
	
		if x > nearPlatform.x  + nearPlatform.sprite_width/2 and y> nearPlatform.y-height-1 and y < nearPlatform.y+height+1 {  // bounces player from right or left of platform
			xspd = -xspd
		}else if x < nearPlatform.x  + nearPlatform.sprite_width/2 and y> nearPlatform.y-height-1 and y < nearPlatform.y+height+1 {
			xspd = -xspd
		}


	}else{ // player is no longer grounded on platform
		grounded = false
	}

	if grounded = true and yspd >0 { // grounds player and prevents downwards motion
		yspd = 0
	}

	// ENEMIES AND LAVA
	// Collision detector for enemy bird
	if collision_rectangle(x-width,y-height,x+width,y+height,obj_enemy,false,false){
		enemy = instance_nearest(x,y,obj_enemy)
		if enemy.threat = true{
			alive = false
			global.LIVES -= 1 
			respawnTimer = respawnTimerMax
		}
	}
	//for enemy rider
	if collision_rectangle(x-width,y-height,x+width,y+height,obj_enemy_top,false,false){
		enemy = instance_nearest(x,y,obj_enemy_top)
		enemy.threat = false
		global.SCORE += enemy.myScore
		yspd = -(yspd/2) - .05
		instance_deactivate_object(enemy)
		
	}
	
	//for eggs
	if collision_rectangle(x-width,y-height,x+width,y+height,obj_egg,false,false){
		egg = instance_nearest(x,y,obj_egg)
		global.SCORE += egg.myScore
		instance_deactivate_object(egg)
		global.ENEMYCOUNT -=1
	}


	// Collision detector for Lava
	if collision_rectangle(x-width,y-height,x+width,y+height,obj_lava,false,false){
		alive = false
		global.LIVES -= 1
		respawnTimer = respawnTimerMax

	}
	
	if global.SCORE > (newlifecounter * newlifescore){
		newlifecounter += 1
		newlifescore += 1
		global.LIVES += 1 

	}
}
// Respawns player at starting position with no movement
if alive = false{
	image_alpha = 0
	respawnTimer -=1
	if respawnTimer <= 0{
		if global.LIVES >= 0 {
			image_alpha = 1
			x = startX
			y = startY
			alive = true
			yspd = 0
			xspd = 0
		}else{
			global.GAMEOVER = true
		}
	}
}

