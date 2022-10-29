as yet unclassified
allFibersDo: aBlock

	self childrenDo: [:child | child allFibersDo: aBlock].
	aBlock value: self