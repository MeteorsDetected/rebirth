/mob/proc/getClickAccess(atom/target)
	return CLICK_ACCESS_DIRECT

/mob/living/getClickAccess(atom/target)
	if(target in GetAllContents())
		return CLICK_ACCESS_DIRECT
	if(isturf(loc))
		if(canReach(target))
			return CLICK_ACCESS_ADJACENT
		return CLICK_ACCESS_RANGE

/mob/proc/GetAllContents()
	return contents + src

/mob/proc/canReach(atom/target)
	return get_dist(src, target) <= 1
