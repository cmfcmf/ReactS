accessing
props: aDictionary

	self assert: aDictionary isDictionary.
	aDictionary keysAndValuesDo: [:name :value | (value isKindOf: CMFReactHook) ifTrue: [
		self error: 'You must not pass hooks in props. Instead, get the data you need from the hook (for example, myState >> get and myState >> setter) and pass these as props.)']].
	
	props := aDictionary