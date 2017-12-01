/mob/living/carbon/human/mobClickOn(atom/target, params)
	var/obj/item/I = null //getAciveHand()
	var/access = getClickAccess(target)
	if(I)
		return I.itemClick(target, src, access, params)
	else
		// attack_hand and so on
		return