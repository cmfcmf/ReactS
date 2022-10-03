as yet unclassified
firstHostChild

	self node isHostComponent ifTrue: [^ self].
	^ self child ifNotNil: [:c | c firstHostChild]