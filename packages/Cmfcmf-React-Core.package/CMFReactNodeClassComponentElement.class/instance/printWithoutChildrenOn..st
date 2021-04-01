printing
printWithoutChildrenOn: aStream

	aStream 
		nextPut: $<;
		nextPutAll: elementClass asString.
		
	self key ifNotNil: [aStream nextPutAll: ' key="'; nextPutAll: self key asString; nextPut: $"].
	
	props keysAndValuesDo: [:key :value | aStream 
		space; 
		nextPutAll: key asString; 
		nextPutAll: '="'; 
		nextPutAll: ((value respondsTo: #sourceString) ifTrue: [value sourceString] ifFalse: [value asString]); 
		nextPut: $"].
	
	(props includesKey: #children) ifFalse: [aStream nextPutAll: ' />'] ifTrue: [aStream nextPut: $>]