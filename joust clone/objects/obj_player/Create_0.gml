/// @description Insert description here
// You can write your code in this editor

startX = x
startY = y

sprite_index = spr_player
alive = true
global.LIVES = 3
global.GAMEOVER = false
global.SCORE = 0
global.LEVEL = 0
newlifecounter = 1
newlifescore = 4999 //new life for 10,000 points



// amount of y acceleration per flap (space)
flap = 1
//left and right movement speed
move = .07

dir = 0   // direction variable (0 = right, 1 = left)

nearPlatform = instance_nearest(x,y,obj_platform)
//checks if the player is on the ground
grounded = false


grav = .06

xspd = 0
yspd = 0

//determinds size of player
height = sprite_height/2
width = sprite_width/2

//time it takes to respawn
respawnTimer = 0
respawnTimerMax = room_speed*2
