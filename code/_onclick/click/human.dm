/mob/living/carbon/human/mobClickOn(atom/target)
	var/target_accesable = FALSE

	if(target in GetAllContents()) // Direct access
		target_accesable = CLICK_ACCESS_DIRECT

	else if(isturf(user.loc))
		target_accesable = CLICK_ACCESS_RANGE
		if(CanReach(A,W))
			target_accesable = CLICK_ACCESS_ADJACENT

