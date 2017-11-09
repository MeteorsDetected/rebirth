//Hooks for overriding. By default just call original procs.

/mob/living/silicon/robot/ShiftClickOn(var/atom/A)
	A.robotShiftClick(src)

/atom/proc/robotShiftClick(var/mob/user)
	ShiftClick(user)

/mob/living/silicon/robot/AltClickOn(var/atom/A)
	A.robotAltClick(src)

/atom/proc/robotAltClick(var/mob/user)
	AltClick(user)

/mob/living/silicon/robot/CtrlClickOn(var/atom/A)
	A.robotCtrlClick(src)

/atom/proc/robotCtrlClick(var/mob/user)
	CtrlClick(user)

/mob/living/silicon/robot/CtrlShiftClickOn(var/atom/A)
	A.robotCtrlShiftClick(src)

/atom/proc/robotCtrlShiftClick(var/mob/user)
	CtrlShiftClick(user)
