/obj/item/proc/itemClick(atom/target, mob/living/user, access = null, list/params)
	if(target == src)
		return attackSelf(user)

	switch(access)
		if(CLICK_ACCESS_DIRECT, CLICK_ACCESS_ADJACENT)
			if(!attack(user, target, params))
				var/resolved = target.attackBy(src, user, params)
				// bypass after attack for items on mob
				if(!resolved && target && src && access == CLICK_ACCESS_ADJACENT)
					afterAttack(target, user, TRUE, params)
		if(CLICK_ACCESS_RANGE)
			afterAttack(target, user, FALSE, params)

//do stuff before attackby!
/obj/item/proc/attack(atom/target, mob/user, params)

/obj/item/proc/afterAttack(atom/target, mob/user, params)

/obj/item/proc/attackSelf(mob/user)

/atom/proc/attackBy(obj/item/W, mob/user, params)