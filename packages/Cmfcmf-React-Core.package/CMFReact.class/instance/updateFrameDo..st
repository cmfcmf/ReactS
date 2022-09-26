lifecycle
updateFrameDo: aBlock

	| ret |
	ret := aBlock value.
	self performRenderChanges.
	self performPendingEffects.
	^ ret