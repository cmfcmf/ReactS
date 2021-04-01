printing
printWithoutChildrenOn: aStream

	aStream nextPut: $<.
	self key ifNotNil: [
		aStream
			nextPutAll: 'key="';
			nextPutAll: self key asString;
			nextPutAll: '"'].
	children ifEmpty: [aStream nextPutAll: '/>'] ifNotEmpty: [aStream nextPut: $>]