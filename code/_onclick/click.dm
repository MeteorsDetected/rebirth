// 1 decisecond click delay (above and beyond mob/next_move)
/client/var/next_click = 0
/mob/var/next_move = null

/*
	Before anything else, defer these calls to a per-mobtype handler.  This allows us to
	remove istype() spaghetti code, but requires the addition of other handler procs to simplify it.

	Alternately, you could hardcode every mob's variation in a flat ClickOn() proc; however,
	that's a lot of code duplication and is hard to maintain.

	Note that this proc can be overridden, and is in the case of screen objects.
*/

/client/proc/updateClickDelay()
	if(next_click >= world.time)
		next_click = world.time + 1
		return TRUE
	return FALSE


/client/Click(atom/target, location, control, params)
	//check'n'update delay
	if(!updateClickDelay())
		return

	//handle client level actoins (buildmode)
	//Nothing right now

	//default behavior
	if(!target.Click(location, control, params))
		mob.ClickOn(target, params)

/atom/Click(location, control, params)
	return FALSE //do not catch click


/client/DblClick(atom/target, location, control, params)
	//check'n'update delay
	if(!updateClickDelay())
		return

	//handle client level actoins (buildmode)
	//Nothing right now

	//default behavior
	if(!target.DblClick(location, control, params))
		mob.DblClickOn(target, params)

/atom/DblClick(location, control, params)
	return FALSE


/*
	Standard mob ClickOn()
	Handles exceptions: middle click, modified clicks, mech actions

	After that, mostly just check your state, check whether you're holding an item,
	check whether you're adjacent to the target, then pass off the click to whoever
	is recieving it.
	The most common are:
	* mob/UnarmedAttack(atom,adjacent) - used here only when adjacent, with no item in hand; in the case of humans, checks gloves
	* atom/attackby(item,user) - used only when adjacent
	* item/afterattack(atom,user,adjacent,params) - used both ranged and adjacent
	* mob/RangedAttack(atom,params) - used only ranged, only used for tk and laser eyes but could be changed
*/
/mob/proc/ClickOn(var/atom/A, var/params)
	return

//Default behavior:
// ignore double clicks, the second click that makes the doubleclick call already calls for a normal click
/mob/proc/DblClickOn(var/atom/A, var/params)

	var/list/modifiers = params2list(params)
	if(modifiers["shift"] && modifiers["ctrl"])
		CtrlShiftClickOn(A)
		return TRUE
	if(modifiers["middle"])
		MiddleClickOn(A)
		return TRUE
	if(modifiers["shift"])
		ShiftClickOn(A)
		return TRUE
	if(modifiers["alt"]) // alt and alt-gr (rightalt)
		AltClickOn(A)
		return TRUE
	if(modifiers["ctrl"])
		CtrlClickOn(A)
		return TRUE

	if(!canClick()) // in the year 2000...
		return TRUE


/mob/proc/setClickCooldown(var/timeout)
	next_move = max(world.time + timeout, next_move)

/mob/proc/canClick()
	return (next_move <= world.time)

/*
	Middle click
	Only used for swapping hands
*/
/mob/proc/MiddleClickOn(var/atom/A)

/*
	Shift click
	For most mobs, examine.
	This is overridden in ai.dm
*/
/mob/proc/ShiftClickOn(var/atom/A)
	A.ShiftClick(src)

/atom/proc/ShiftClick(var/mob/user)
/*
	if(src in view(user))
		user.examinate(src)
*/

/*
	Alt click
	Unused except for AI
*/
/mob/proc/AltClickOn(var/atom/A)
	A.AltClick(src)

/atom/proc/AltClick(var/mob/user)

/*
	Ctrl click
	For most objects, pull
*/
/mob/proc/CtrlClickOn(var/atom/A)
	A.CtrlClick(src)

/atom/proc/CtrlClick(var/mob/user)

/*
	Control+Shift click
	Unused except for AI
*/
/mob/proc/CtrlShiftClickOn(var/atom/A)
	A.CtrlShiftClick(src)

/atom/proc/CtrlShiftClick(var/mob/user)
