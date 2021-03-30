as yet unclassified
extent: aPoint

	| oldExtent newExtent |
	oldExtent := self extent.
	super extent: aPoint.
	newExtent := self extent.
	(newExtent ~= oldExtent and: [onChangeExtent notNil]) ifTrue: [onChangeExtent value: newExtent]