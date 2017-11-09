// Basic atom
/atom/proc/Bumped(atom/movable/o)
	set waitfor = FALSE

/atom/Enter(atom/movable/o, atom/oldloc)
	return o.onEnter(src, oldloc, ..())

/atom/Exit(atom/movable/o, atom/newloc)
	return o.onExit(src, newloc, ..())

/atom/Entered(atom/movable/o, atom/oldloc)
	o.onEntered(src, oldloc)
	..()

/atom/Exited(atom/movable/o, atom/newloc)
	o.onExited(src, newloc)
	..()

// Movable atom
/atom/movable/Cross(atom/movable/o)
	return o.onCross(src, ..())

/atom/movable/Uncross(atom/movable/o)
	return o.onUncross(src, ..())

/atom/movable/Crossed(atom/movable/o)
	o.onCrossed(src)
	..()

/atom/movable/Uncrossed(atom/movable/o)
	o.onUncrossed(src)
	..()

/atom/movable/Bump(atom/o)
	o.Bumped(src)
	..()

/atom/movable/proc/onEnter(atom/o, atom/oldloc, retval)
	set waitfor = FALSE
	return retval

/atom/movable/proc/onExit(atom/o, atom/newloc, retval)
	set waitfor = FALSE
	return retval

/atom/movable/proc/onEntered(atom/o, atom/oldloc)
	set waitfor = FALSE

/atom/movable/proc/onExited(atom/o, atom/newloc)
	set waitfor = FALSE

/atom/movable/proc/onCross(atom/movable/o, retval)
	set waitfor = FALSE
	return retval

/atom/movable/proc/onUncross(atom/movable/o, retval)
	set waitfor = FALSE
	return retval

/atom/movable/proc/onCrossed(atom/movable/o)
	set waitfor = FALSE

/atom/movable/proc/onUncrossed(atom/movable/o)
	set waitfor = FALSE


