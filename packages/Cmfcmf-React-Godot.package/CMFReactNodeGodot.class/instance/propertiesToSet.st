accessing
propertiesToSet

	^ properties select: [:val | val isGodotNode not]