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