/mob/debug
	icon = 'icons/mob/mob.dmi'
	icon_state = "repairbot"

/mob/debug/New()
	..()
	forceMove(locate(14,14,1))

/mob/debug/mobClickOn(atom/target)
	src << "dist = [get_dist(src, target)]"
	switch(getClickAccess(target))
		if(CLICK_ACCESS_DIRECT)
			src << "CLICK_ACCESS_DIRECT"
		if(CLICK_ACCESS_ADJACENT)
			src << "CLICK_ACCESS_ADJACENT"
		if(CLICK_ACCESS_RANGE)
			src << "CLICK_ACCESS_RANGE"
		else
			src << "NO_ACCEESS"


/mob/debug/getClickAccess(atom/target)
	if(target in GetAllContents()) // Direct access
		return CLICK_ACCESS_DIRECT
	if(isturf(loc))
		if(canReach(target))
			return CLICK_ACCESS_ADJACENT
		return CLICK_ACCESS_RANGE