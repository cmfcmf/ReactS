printing
printOn: aStream

	self printWithoutChildrenOn: aStream.
	children ifNotEmpty: [
		children do: [:each | aStream cr. each printOn: aStream].
		aStream cr; nextPutAll: '</>']