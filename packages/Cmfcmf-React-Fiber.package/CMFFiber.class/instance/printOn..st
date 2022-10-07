as yet unclassified
printOn: aStream

	aStream nextPutAll: 'CMFFiber('.
	self node printOn: aStream.
	aStream nextPut: $)