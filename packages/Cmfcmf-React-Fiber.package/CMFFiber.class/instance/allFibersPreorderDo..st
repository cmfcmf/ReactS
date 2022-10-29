as yet unclassified
allFibersPreorderDo: aBlock

	aBlock value: self.
	self childrenDo: [:child | child allFibersPreorderDo: aBlock]