/atom/movable/proc/canMove(atom/NewLoc, Dir = 0, Step_x = 0, Step_y = 0)
	set waitfor = FALSE
	return TRUE

/atom/movable/proc/Moved(atom/OldLoc, oDir, oSx, oSy)
	set waitfor = FALSE

/atom/movable/Move(atom/NewLoc, Dir = 0)
	var/oLoc = loc
	var/oDir = dir
	. = canMove(arglist(args)) && ..()
	if(. || dir != oDir)
		Moved(oLoc, oDir)


/atom/movable/proc/forceMove(atom/NewLoc, Dir = 0)
	var/OldLoc = loc
	var/oDir = dir
	if(!Dir)
		Dir = dir
	if(loc == NewLoc)
		if(dir != Dir)
			dir = Dir
			Moved(OldLoc, oDir)
			return TRUE
		else
			return FALSE
	else if(isturf(NewLoc) && isturf(loc))
		if(z == NewLoc.z)
			var/dx = (x - NewLoc.x)
			var/dy = (y - NewLoc.y)
			if(!dx && !dy)
				if(dir != Dir)
					dir = Dir
					Moved(OldLoc, oDir)
					return TRUE
				else
					return FALSE

	var/list/olocs, list/nlocs
	var/list/oareas = list(), list/nareas = list()
	var/list/oobjs, list/nobjs

	olocs = locs

	if(isturf(loc))
		for(var/turf/t in olocs)
			oareas |= t.loc
		oobjs = obounds(src) || list()
		oobjs -= locs
	else
		oobjs = list()

	loc = NewLoc
	dir = Dir

	nlocs = locs
	if(isturf(loc))
		nlocs = locs
		for(var/turf/t in nlocs)
			nareas |= t.loc
		nobjs = obounds(src) || list()
		nobjs -= locs
	else
		nobjs = list()

	var/list/xareas = oareas-nareas, list/eareas = nareas-oareas
	var/list/xlocs = olocs-nlocs, list/elocs = nlocs-olocs
	var/list/xobjs = oobjs-nobjs, list/eobjs = nobjs-oobjs

	for(var/area/a in xareas)
		a.Exited(src,loc)
	for(var/turf/t in xlocs)
		t.Exited(src,loc)
	for(var/atom/movable/o in xobjs)
		o.Uncrossed(src)

	for(var/area/a in eareas)
		a.Entered(src, OldLoc)
	for(var/turf/t in elocs)
		t.Entered(src, OldLoc)
	for(var/atom/movable/o in eobjs)
		o.Crossed(src)

	Moved(OldLoc, oDir)
	return TRUE
