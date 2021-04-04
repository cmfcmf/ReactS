printing
printTagNameOn: aStream

	selector ~~ #render:
		ifTrue: [
			aStream 
				nextPutAll: selector asString allButLast;
				nextPut: $(;
				nextPutAll: elementClass asString;
				nextPut: $)]
		ifFalse: [aStream nextPutAll: elementClass asString.]