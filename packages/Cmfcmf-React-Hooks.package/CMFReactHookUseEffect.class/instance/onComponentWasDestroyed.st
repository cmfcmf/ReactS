as yet unclassified
onComponentWasDestroyed

	cleanup ifNotNil: [cleanup value].
	effect := cleanup := nil.
	