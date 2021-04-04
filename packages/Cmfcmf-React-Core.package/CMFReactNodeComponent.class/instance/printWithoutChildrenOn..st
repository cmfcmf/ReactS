printing
printWithoutChildrenOn: aStream

	aStream nextPut: $<.
	self printTagNameOn: aStream.
		
	self hasKey ifTrue: [aStream nextPutAll: ' key="'; nextPutAll: self key asString; nextPut: $"].
	
	props keysAndValuesDo: [:key :value | 
		(key == #children or: [key == #key]) ifFalse: [aStream 
			space; 
			nextPutAll: key asString; 
			nextPutAll: '="'; 
			nextPutAll: ((value respondsTo: #sourceString) ifTrue: [value sourceString] ifFalse: [value asString]); 
			nextPut: $"]].
	
	(props includesKey: #children) ifFalse: [aStream nextPutAll: ' />'] ifTrue: [aStream nextPut: $>]