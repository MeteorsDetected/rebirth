/mob/observer/dead/mobClickOn(atom/A)
	setClickCooldown(4)
	A.ghostInteract(src)

/atom/proc/ghostInteract(mob/observer/dead/user)