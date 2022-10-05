as yet unclassified
hostSiblingsDo: aBlock

	" FIXME not pretty here "
	self node class = CMFReactNodePortal ifTrue: [^ self].
	
	self node isHostComponent
		ifTrue: [aBlock value: self]
		ifFalse: [self child ifNotNil: [:c | c hostSiblingsDo: aBlock]].
	self sibling ifNotNil: [:c | c hostSiblingsDo: aBlock]