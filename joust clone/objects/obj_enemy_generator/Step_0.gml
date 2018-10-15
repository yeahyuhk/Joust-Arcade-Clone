max_enemies = 3 + global.LEVEL

if levelStart = true{
	if enemies_spawned < max_enemies {
		if spawnTimer >0{
			spawnTimer -=1
		}
		if spawnTimer = 0{
			spawnTimer = spawnTimerMax
			instance_create_depth(room_width/2, 20, 0, obj_enemy)
			enemies_spawned += 1
			global.ENEMYCOUNT += 1
			if enemies_spawned = max_enemies{
				done_spawning = true
			}
		}
	}
}

if done_spawning = true{
	levelStart = false
	if global.ENEMYCOUNT <= 0{
		instance_deactivate_object(obj_enemy)
		enemies_spawned = 0
		global.LEVEL +=1
		if global.LEVEL = 3{
			instance_deactivate_object(obj_platform_bridge)
		}
		levelStart = true
		done_spawning = false
	}
}	


