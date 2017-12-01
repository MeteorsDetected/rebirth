/world
	mob = /mob/debug/click

/mob/debug/click/mobClickOn(atom/target)
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


