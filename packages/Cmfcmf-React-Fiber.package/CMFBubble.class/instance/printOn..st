as yet unclassified
printOn: aStream

	aStream nextPutAll: '<'.
	aStream nextPutAll: (self tag ifNil: ['?']).
	aStream nextPutAll: '/>'