printing
printWithoutChildrenOn: aStream renderResult: renderResult

	aStream nextPut: $<.
	
	renderResult 
		ifNotNil: [aStream 
			nextPutAll: renderResult class asString cmfWithStartingUppercaseCharactersDownshifted;
			nextPutAll: '(', renderResult identityHash, ')']
		ifNil: [aStream nextPutAll: 'someMorph'].
	
	key ifNotNil: [
		aStream
			nextPutAll: ' key="';
			nextPutAll: key asString;
			nextPut: $"].
	(children isNil or: [children isEmpty]) ifTrue: [aStream nextPutAll: ' />'] ifFalse: [aStream nextPut: $>]