as yet unclassified
printTreeOn: aStream indent: aNumber

	aNumber timesRepeat: [aStream tab].
	aStream print: self node.
	aStream cr.
	self child ifNotNil: [self child printTreeOn: aStream indent: aNumber + 1].
	self sibling ifNotNil: [self sibling printTreeOn: aStream indent: aNumber]