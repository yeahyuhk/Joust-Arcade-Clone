/// @description Insert description here
// You can write your code in this editor

if room == title{
	if keyboard_check_released(vk_enter){
		room_goto(1)
	}
}

if room == endscreen{
	if keyboard_check_released(vk_enter){
		room_goto(0)
	}
}

if global.GAMEOVER = true{
	room_restart()
	room_goto(2)
}