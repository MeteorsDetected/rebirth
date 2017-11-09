/mob/observer/dead/ClickOn(var/atom/A, var/params)
	. = ..()
	if(.)
		return

	setClickCooldown(4)

	A.ghostInteract(src)

/atom/proc/ghostInteract(mob/observer/dead/user)