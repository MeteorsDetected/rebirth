/obj/item/proc/itemClick(mob/living/user, atom/target, list/params)
	if(target == src)
		return attackSelf(user)

	if(attack(user, target, params))
		var/resolved = target.attackBy(src, user, params)
		if(!resolved && target && src)
			afterAttack(target, user, 1, params)

//do stuff before attackby!
/obj/item/proc/attack(atom/A, mob/user, params)
	//return FALSE to avoid calling attackby after this proc does stuff
	return FALSE


/obj/item/proc/afterAttack(atom/A, mob/user, params)

/obj/item/proc/attackSelf(mob/user)

/atom/proc/attackBy(obj/item/W, mob/user, params)