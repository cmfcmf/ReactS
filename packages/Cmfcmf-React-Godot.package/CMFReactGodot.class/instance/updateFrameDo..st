lifecycle
updateFrameDo: aBlock

	| ret |
	pendingUpdates := OrderedCollection new.
	ret := aBlock value.
	Transcript showln: pendingUpdates asJsonString.
	^ ret