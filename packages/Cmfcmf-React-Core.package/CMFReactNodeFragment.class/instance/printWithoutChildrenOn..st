printing
printWithoutChildrenOn: aStream

	aStream nextPut: $<.
	self hasKey ifTrue: [
		aStream
			nextPutAll: 'key="';
			nextPutAll: self key asString;
			nextPutAll: '"'].
	children ifEmpty: [aStream nextPutAll: '/>'] ifNotEmpty: [aStream nextPut: $>]