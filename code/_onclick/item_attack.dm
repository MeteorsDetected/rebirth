/obj/item/proc/itemClick(mob/living/user, atom/target, list/params)
	if(target == src)
		return attack_self(user)

	if(attack(user, target, params))
		var/resolved = target.attackedBy(src, user, params)
		if(!resolved && target && !QDELETED(src))
			afterattack(target, user, 1, params)

//do stuff before attackby!
/obj/item/proc/attack(atom/A, mob/user, params)
	//return FALSE to avoid calling attackby after this proc does stuff
	return FALSE


/obj/item/proc/afterAttack(atom/A, mob/user, params)


/atom/proc/attackby(obj/item/W, mob/user, params)