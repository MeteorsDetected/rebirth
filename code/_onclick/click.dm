// 1 decisecond click delay (above and beyond mob/next_move)
/client/var/next_click = 0

/*
	Before anything else, defer these calls to a per-mobtype handler.  This allows us to
	remove istype() spaghetti code, but requires the addition of other handler procs to simplify it.

	Alternately, you could hardcode every mob's variation in a flat ClickOn() proc; however,
	that's a lot of code duplication and is hard to maintain.

	Note that this proc can be overridden, and is in the case of screen objects.
*/

/client/Click(atom/target, location, control, params)
	//check'n'update delay
	//<...>

	//handle client level actoins (buildmode)
	//<...>

	//default behavior
	if(!target.Click(location, control, params))
		mob.ClickOn(target, params)

/atom/Click(location, control, params)
	return FALSE //do not catch click

/client/DblClick(atom/target, location, control, params)
	//check'n'update delay

	//handle client level actoins (buildmode)

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
	return

