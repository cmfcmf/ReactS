as yet unclassified
props: aDictionaryOrSequenceableCollection

	props := aDictionaryOrSequenceableCollection isDictionary 
		ifTrue: [aDictionaryOrSequenceableCollection] 
		ifFalse: [Dictionary newFrom: aDictionaryOrSequenceableCollection]