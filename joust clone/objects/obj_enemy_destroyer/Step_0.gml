
//DETECTS any emeny birds that leave the screen and destroys them 
if collision_rectangle(x-width,y-height,x+width,y+height,obj_enemy,false,false){
	kill_enemy = instance_nearest(x,y,obj_enemy)
	instance_deactivate_object(kill_enemy)
}