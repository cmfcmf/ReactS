as yet unclassified
hostChildrenDo: aBlock

	self child ifNotNil: [:c | c hostSiblingsDo: aBlock]