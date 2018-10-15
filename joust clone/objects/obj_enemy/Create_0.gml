//object for enemy bird/ bottom half
randomize()

threat = true
sprite_index = spr_enemy
alive = true

// amount of y acceleration per flap (space)
flap = random_range(.5,1) 
flapTimer = 0
flapTimerMax = room_speed*(random_range(.1,.5))

//left and right movement speed
//randomized for enemy
move = .07 * irandom_range(-1,1) // random int for direction change
if move = 0{ //  in case irandom returns zero
	move = 0.7
}
maxspd = random_range(1,3)

dir = 0   // direction variable (0 = right, 1 = left)

nearPlatform = instance_nearest(x,y,obj_platform)

//checks if the player is on the ground
grounded = false

grav = .04

xspd = 0
yspd = 0

//determinds size of enemy
height = sprite_height/2
width = sprite_width/2

//associates enemy bird with rider
myRider = instance_create_depth(x,y,0,obj_enemy_top)

//random enemy movement and flapping

