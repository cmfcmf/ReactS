lifecycle
onComponentWasDestroyed

	cleanup ifNotNil: [
			"do not allow nested hooks"
			CMFCurrentReact value: nil during: [cleanup value]].
	effect := cleanup := nil.
	