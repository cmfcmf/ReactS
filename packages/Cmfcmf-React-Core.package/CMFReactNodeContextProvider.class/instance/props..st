accessing
props: aDictionary

	self assert: aDictionary isDictionary.
	self assert: aDictionary size == 2.
	self assert: (aDictionary includesKey: #children).
	self assert: (aDictionary includesKey: #value).
	
	props := aDictionary