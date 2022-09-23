lifecycle
updateFrameDo: aBlock

	| ret |
	ret := aBlock value.
	self performPendingEffects.
	^ ret