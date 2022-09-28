rendering
performPendingEffects

	| currentPendingEffects |
	currentPendingEffects := pendingEffects.
	pendingEffects := nil.
	currentPendingEffects ifNotNil: [currentPendingEffects do: [:effect | effect onComponentWasRendered]]