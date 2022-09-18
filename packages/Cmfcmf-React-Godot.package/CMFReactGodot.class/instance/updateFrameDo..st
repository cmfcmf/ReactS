lifecycle
updateFrameDo: aBlock

	| ret |
	pendingUpdates := OrderedCollection new.
	ret := aBlock value.
	^ ret