//The byond version of these verbs wait for the next tick before acting.
//	instant verbs however can run mid tick or even during the time between ticks.
/client/verb/moveup()
	set name = ".moveup"
	set instant = 1
	mob.selfMove(NORTH)

/client/verb/movedown()
	set name = ".movedown"
	set instant = 1
	mob.selfMove(SOUTH)

/client/verb/moveright()
	set name = ".moveright"
	set instant = 1
	mob.selfMove(EAST)

/client/verb/moveleft()
	set name = ".moveleft"
	set instant = 1
	mob.selfMove(WEST)


/mob/proc/diagonal_action(direction)

/client/Northeast()
	mob.diagonal_action(NORTHEAST)

/client/Northwest()
	mob.diagonal_action(NORTHWEST)

/client/Southeast()
	mob.diagonal_action(SOUTHEAST)

/client/Southwest()
	mob.diagonal_action(SOUTHWEST)


/mob/proc/selfMove(dir)
