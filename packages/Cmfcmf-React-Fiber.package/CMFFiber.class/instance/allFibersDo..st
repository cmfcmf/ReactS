as yet unclassified
allFibersDo: aBlock

	self child ifNotNil: [:child | child allFibersDo: aBlock].
	aBlock value: self.
	self sibling ifNotNil: [:sibling | sibling allFibersDo: aBlock]