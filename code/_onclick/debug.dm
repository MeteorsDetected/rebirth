/mob/debug
	icon = 'icons/mob/mob.dmi'
	icon_state = "repairbot"

/mob/debug/New()
	..()
	forceMove(locate(14,14,1))

/mob/debug/getClickAccess(atom/target)
	if(target in GetAllContents()) // Direct access
		return CLICK_ACCESS_DIRECT
	if(isturf(loc))
		if(canReach(target))
			return CLICK_ACCESS_ADJACENT
		return CLICK_ACCESS_RANGE

/proc/access2text(access)
	switch(access)
		if(CLICK_ACCESS_DIRECT)
			return "CLICK_ACCESS_DIRECT"
		if(CLICK_ACCESS_ADJACENT)
			return "CLICK_ACCESS_ADJACENT"
		if(CLICK_ACCESS_RANGE)
			return "CLICK_ACCESS_RANGE"
		else
			return "NO_ACCEESS"

