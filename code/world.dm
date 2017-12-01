//This file is just for the necessary /world definition
//Try looking in game/world.dm

/world
	mob = /mob/debug
	turf = /turf/unsimulated/floor
	//DEBUG_STAGE
	/*
	mob = /mob/dead/new_player
	turf = /turf/space
	*/
	area = /area/space
	view = 7
	cache_lifespan = 7	//stops player uploaded stuff from being kept in the rsc past the current session

	name = "Old World"
	fps = 25			// 25 frames per second
	icon_size = 32		// 32x32 icon size by default

#ifdef GC_FAILURE_HARD_LOOKUP
	loop_checks = FALSE
#endif

