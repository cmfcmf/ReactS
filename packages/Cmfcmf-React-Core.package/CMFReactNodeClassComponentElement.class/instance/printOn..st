printing
printOn: aStream

	self printWithoutChildrenOn: aStream.
	(props includesKey: #children) ifTrue: [
		(props at: #children) do: [:each | aStream cr. each printOn: aStream].
		aStream 
			cr;
			nextPut: $<;
			nextPutAll: elementClass asString;
			nextPutAll: ' />']