/// @description Insert description here
// You can write your code in this editor

alive = true
player_lives = 4

// amount of y acceleration per flap (space)
flap = 1
//left and right movement speed
move = .11

dir = 0   // direction variable (0 = right, 1 = left)

nearPlatform = instance_nearest(x,y,obj_platform)
//checks if the player is on the ground
grounded = false


grav = .05

xspd = 0
yspd = 0

//determinds size of player
height = sprite_height/2
width = sprite_width/2