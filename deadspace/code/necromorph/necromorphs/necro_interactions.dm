//Special necro interactions for objects should go here

//Marker
/obj/structure/marker/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_narsiesmall("MAKE US WHOLE")) //Might as well scare the bajeebus out of them
	return

//Corruption
/obj/structure/corruption/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	return //Necros shouldn't be allowed to damage corruption, as it is a part of convergence

/obj/structure/necromorph/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	return //Same as corruption, necros should not damage it except in specific instances

//Placeholder for necromorph wall growths, uncomment when in
/*/obj/structure/necromorph/wall/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers, dealt_damage)
	if(user.combat_mode)
		dealt_damage = rand(user.melee_damage_lower, user.melee_damage_upper)
		user.do_attack_animation(src, "smash")
		user.play_necro_sound(SOUND_ATTACK, VOLUME_HIGH, 1, 3)
		user.changeNext_move(CLICK_CD_MELEE) //So necros don't JoJo
		attack_generic(user, dealt_damage, BRUTE, MELEE, TRUE)
		return //Necro walls can be attacked by necros
	else
		return */

//Ladders
/obj/structure/ladder/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	return use(user, is_ghost = FALSE)

//Closets
/obj/structure/closet/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	if(!user.combat_mode)
		return attack_hand(user, modifiers) //Try to open/close the locker
	else
		return ..() //If we're in combat mode, just start attacking the locker

//Shuttles
/obj/structure/shuttle/engine/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

//Basic stuff
/obj/item/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	if(!user.combat_mode) //So it doesn't spam this while fighting
		to_chat(user, span_notice("This has no use for Convergence."))
	return //Necros aren't allowed to interact with items, with some exceptions

/obj/structure/table/optable/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/iv_drip/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	if(!user.combat_mode) //So it doesn't spam this while fighting
		to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/stasis/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return


/obj/machinery/bodyscanner/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return


/obj/machinery/sleeper/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return


//Consoles
/obj/machinery/modular_computer/console/preset/command/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/computer/communications/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/computer/emergency_shuttle/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/bodyscanner_console/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

//Power based
/obj/structure/cable/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	if(!user.combat_mode) //So it doesn't spam this while fighting
		to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/button/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/power/apc/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/power/generator/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	log_combat(user, src, "tried to attack") //Lets us know when necros are trying to be naughty
	return

/obj/machinery/power/terminal/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/machinery/telecomms/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	log_combat(user, src, "tried to attack") //Lets us know when necros are trying to be naughty
	return

/obj/machinery/power/smes/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	to_chat(user, span_notice("This has no use for Convergence."))
	log_combat(user, src, "tried to attack") //Lets us know when necros are trying to be naughty
	return

/obj/machinery/power/supermatter/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	dust_mob(user) //What did you think was going to happen?
	return

//Atmos based
/obj/machinery/atmospherics/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	if(!user.combat_mode) //So it doesn't spam this while fighting
		to_chat(user, span_notice("This has no use for Convergence."))
	return

/obj/structure/disposalpipe/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	if(!user.combat_mode) //So it doesn't spam this while fighting
		to_chat(user, span_notice("This has no use for Convergence."))
	return

//Airlocks
/obj/structure/fence/door/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers)
	if(!user.combat_mode)
		return attack_hand(user) //Try to open/close the fence door
	else
		return ..() //Otherwise, smash it

/obj/machinery/door/airlock/attack_necromorph(mob/living/carbon/human/necromorph/user, list/modifiers, dealt_damage)
	if(isElectrified() && shock(user, 100))
		add_fingerprint(user)
		return
	if(!density)
		return try_to_activate_door(user) //Try to close the door
	if(!locked || !welded || !seal || hasPower())
		if(!user.combat_mode)
			return try_to_activate_door(user) //Try to open the door
	if(locked || welded || seal)
		if(user.combat_mode)
			dealt_damage = rand(user.melee_damage_lower, user.melee_damage_upper) + 8 //extra damage to overwhelm airlock damage deflection
			user.do_attack_animation(src, "smash")
			user.play_necro_sound(SOUND_ATTACK, VOLUME_HIGH, 1, 3)
			user.changeNext_move(CLICK_CD_MELEE) //So necros don't JoJo
			attack_generic(user, dealt_damage, BRUTE, MELEE, TRUE)
			return //Angry necro smash locked door
		to_chat(user, span_warning("[src] refuses to budge!"))
		return
	add_fingerprint(user)
	user.visible_message(span_warning("[user] begins prying open [src]."),\
						span_warning("You begin prying open [src] with all your might!"),\
						span_warning("You hear groaning metal..."))
	var/time_to_open = 0.5 SECONDS
	if(hasPower())
		//Powered airlocks take longer to open, and are loud.
		time_to_open = 5 SECONDS
		playsound(src, 'sound/machines/airlock_alien_prying.ogg', 100, TRUE)

	if(do_after(user, src, time_to_open))
		//The airlock is still closed, but something prevented it opening. (Another player noticed and bolted/welded the airlock in time!)
		if(density && !open(2))
			to_chat(user, span_warning("Despite your efforts, [src] managed to resist your attempts to open it!"))
		else
			atom_break()
			playsound(src, 'sound/machines/airlock_tear_open.ogg', 50, TRUE)
