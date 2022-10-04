as yet unclassified
hostSiblingsDo: aBlock

	self node isHostComponent ifTrue: [^ aBlock value: self].
	self child ifNotNil: [:c | c hostChildrenDo: aBlock].
	self sibling ifNotNil: [:c | c hostChildrenDo: aBlock]