/world
	mob = /mob/debug/itemClick

/mob/debug/itemClick
	var/obj/item/click_debug/debugger = new

/mob/debug/itemClick/New()
	..()
	world << "ITEM CLICK DEBUGGING"

/mob/debug/itemClick/mobClickOn(atom/target, params)
	var/access = getClickAccess(target)
	src << "mobClickOn called. Access: [access2text(access)]."
	debugger.itemClick(target, src, access, params)

/obj/item/click_debug
	name = "click debuggerrr"

/obj/item/click_debug/attack(target, user, params)
	user << "- Attack called"
	return ..()

/obj/item/click_debug/afterAttack(atom/target, user, adjacent, params)
	var/_adjacent = adjacent ? "Close" : "Range"
	var/coords = "[target.x], [target.y], [target.z]"
	user << "- afterAttack ([coords]) by [user] was [_adjacent]"

/obj/item/click_debug/attackSelf(user)
	user << "- attackSelf called"

/turf/attackBy(obj/item/W, mob/user, params)
	user << "- attackBy called with [W] by [user]"