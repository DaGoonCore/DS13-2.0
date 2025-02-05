/atom/movable/proc/can_be_grabbed(mob/living/grabber, target_zone, use_offhand)
	if(!istype(grabber) || !isturf(loc) || !isturf(grabber.loc))
		return FALSE
	if(SEND_SIGNAL(src, COMSIG_ATOM_CAN_BE_GRABBED, grabber) & COMSIG_ATOM_NO_GRAB)
		return FALSE
	if(!grabber.canUseTopic(src, USE_CLOSE|USE_IGNORE_TK))
		return FALSE
	if(!buckled_grab_check(grabber))
		return FALSE
	if(anchored)
		return FALSE
	if(throwing)
		return FALSE
	if(pull_force < (move_resist * MOVE_FORCE_PULL_RATIO))
		to_chat(grabber, span_warning("You aren't strong enough to move [src]!"))
		return FALSE
	return TRUE

/atom/movable/proc/buckled_grab_check(mob/grabber)
	if(grabber.buckled == src && (grabber in buckled_mobs))
		return TRUE
	if(grabber.anchored)
		return FALSE
	if(grabber.buckled)
		return FALSE
	return TRUE

/**
 * Checks if the pulling and pulledby should be stopped because they're out of reach.
 * If z_allowed is TRUE, the z level of the pulling will be ignored.This is to allow things to be dragged up and down stairs.
 */
/atom/movable/proc/recheck_grabs(only_pulling = FALSE, only_pulled = FALSE, z_allowed = FALSE)
	if(only_pulling)
		return

	for(var/obj/item/hand_item/grab/G in grabbed_by)
		if(moving_diagonally != FIRST_DIAG_STEP && !MultiZAdjacent(G.assailant)) //separated from our puller and not in the middle of a diagonal move.
			qdel(G)

/// Move grabbed atoms towards a destination
/mob/living/proc/move_grabbed_atoms_towards(atom/destination)
	for(var/obj/item/hand_item/grab/G in get_active_grabs())
		var/atom/movable/pulling = G.affecting
		if(pulling.anchored || pulling.move_resist > move_force || !pulling.Adjacent(src, src, pulling))
			qdel(G)
			continue

		if(isliving(pulling))
			var/mob/living/pulling_mob = pulling
			if(pulling_mob.buckled && pulling_mob.buckled.buckle_prevents_pull) //if they're buckled to something that disallows pulling, prevent it
				qdel(G)
				continue

		if(destination == loc && pulling.density)
			continue

		var/move_dir = get_dir(pulling.loc, destination)
		if(!Process_Spacemove(move_dir))
			continue

		// At this point the move was successful
		pulling.Move(get_step(pulling.loc, move_dir), move_dir, glide_size)

		pulling.update_offsets()


/atom/movable/proc/update_offsets()
	var/last_pixel_x = pixel_x
	var/last_pixel_y = pixel_y

	var/new_pixel_x = base_pixel_x
	var/new_pixel_y = base_pixel_y

	var/list/grabbed_by = list()

	grabbed_by += src.grabbed_by
	if(isliving(src))
		var/mob/living/L = src
		if(L.buckled)
			grabbed_by += L.buckled.grabbed_by

	if(isturf(loc))
		if(length(grabbed_by))
			for(var/obj/item/hand_item/grab/G in grabbed_by)
				var/grab_dir = get_dir(G.assailant, src)
				if(grab_dir && G.current_grab.shift != 0)
					if(grab_dir & WEST)
						new_pixel_x = min(new_pixel_x+G.current_grab.shift, base_pixel_x+G.current_grab.shift)
					else if(grab_dir & EAST)
						new_pixel_x = max(new_pixel_x-G.current_grab.shift, base_pixel_x-G.current_grab.shift)
					if(grab_dir & NORTH)
						new_pixel_y = max(new_pixel_y-G.current_grab.shift, base_pixel_y-G.current_grab.shift)
					else if(grab_dir & SOUTH)
						new_pixel_y = min(new_pixel_y+G.current_grab.shift, base_pixel_y+G.current_grab.shift)

	if(last_pixel_x != new_pixel_x || last_pixel_y != new_pixel_y)
		animate(src, pixel_x = new_pixel_x, pixel_y = new_pixel_y, 3, 1, (LINEAR_EASING|EASE_IN))

	UPDATE_OO_IF_PRESENT
