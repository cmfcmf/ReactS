as yet unclassified
setAll: aDictionary

	aDictionary ifNotNil: [aDictionary keysAndValuesDo: [:key :value | self set: key to: value]]