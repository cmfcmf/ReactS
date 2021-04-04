printing
printWithoutChildrenOn: aStream renderResult: renderResult

	aStream nextPut: $<.
	
	renderResult 
		ifNotNil: [aStream 
			nextPutAll: renderResult class asString cmfWithStartingUppercaseCharactersDownshifted;
			nextPutAll: '(', renderResult identityHash, ')']
		ifNil: [aStream nextPutAll: 'someMorph'].
	
	self hasKey ifTrue: [
		aStream
			nextPutAll: ' key="';
			nextPutAll: self key asString;
			nextPut: $"].
	(children isNil or: [children isEmpty]) ifTrue: [aStream nextPutAll: ' />'] ifFalse: [aStream nextPut: $>]