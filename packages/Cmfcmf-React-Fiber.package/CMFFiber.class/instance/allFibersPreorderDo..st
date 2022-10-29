as yet unclassified
allFibersPreorderDo: aBlock

	aBlock value: self.
	self child ifNotNil: [:child | child allFibersPreorderDo: aBlock].
	self sibling ifNotNil: [:sibling | sibling allFibersPreorderDo: aBlock]