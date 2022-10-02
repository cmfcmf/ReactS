lifecycle
onComponentWasDestroyed

	cleanup ifNotNil: [
		"do not allow nested hooks"
		CMFCurrentReact value: nil during: [ | doClean |
			doClean := cleanup.
			cleanup := nil.
			doClean value]].
	effect := nil