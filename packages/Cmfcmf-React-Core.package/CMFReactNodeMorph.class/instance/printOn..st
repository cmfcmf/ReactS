printing
printOn: aStream

	self printWithoutChildrenOn: aStream.
	(children isNil or: [children isEmpty]) ifFalse: [
		children do: [:each | aStream cr. each printOn: aStream].
		aStream cr; nextPutAll: '</morph>']