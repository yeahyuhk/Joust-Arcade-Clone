//object for egg
randomize()

//determines size of sprite
height = sprite_height/2
width = sprite_width/2

//associates egg with enemy
myBird = instance_nearest(x,y,obj_enemy)

maxspd = myBird.maxspd
xspd = myBird.xspd
yspd = -2
alive = true

dir = 0   // direction variable (0 = right, 1 = left)

nearPlatform = instance_nearest(x,y,obj_platform)

//checks if the player is on the ground
grounded = false

grav = .04
xslow = .005

myScore = 250
