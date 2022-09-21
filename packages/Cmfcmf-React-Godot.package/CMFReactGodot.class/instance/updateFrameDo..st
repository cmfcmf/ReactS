lifecycle
updateFrameDo: aBlock

	| ret |
	pendingUpdates := OrderedCollection new.
	pendingRefs := OrderedCollection new.
	GDCurrentSession value: session during: [ret := aBlock value].
	^ ret