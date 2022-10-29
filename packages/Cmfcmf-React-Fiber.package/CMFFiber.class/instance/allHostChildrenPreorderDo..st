as yet unclassified
allHostChildrenPreorderDo: aBlock

	self allFibersPreorderDo: [:fiber | (fiber ~= self and: [fiber node isHostComponent]) ifTrue: [aBlock value: fiber]]