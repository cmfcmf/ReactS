rendering
performPendingEffects

	pendingEffects ifNotNil: [pendingEffects do: [:effect | effect onComponentWasRendered]].
	pendingEffects := nil