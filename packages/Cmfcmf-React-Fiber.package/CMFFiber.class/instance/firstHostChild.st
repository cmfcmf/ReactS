as yet unclassified
firstHostChild

	self node class = CMFReactNodePortal ifTrue: [^ nil].
	self node isHostComponent ifTrue: [^ self].
	^ self child ifNotNil: [:c | c firstHostChild]