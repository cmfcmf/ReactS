as yet unclassified
onComponentWasRendered

	(dependencies isNil "wants to always re-execute" or: [hasRun not] "execute on first render") ifTrue: [
		cleanup ifNotNil: [cleanup value].
		cleanup := effect value.
		hasRun := true]