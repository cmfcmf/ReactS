printing
printOn: aStream

	self printWithoutChildrenOn: aStream.
	(props notNil and: [props includesKey: #children]) ifTrue: [
		(props at: #children) do: [:each | aStream cr. each printOn: aStream].
		aStream 
			cr;
			nextPut: $<.
		self printTagNameOn: aStream.
		aStream nextPutAll: ' />']