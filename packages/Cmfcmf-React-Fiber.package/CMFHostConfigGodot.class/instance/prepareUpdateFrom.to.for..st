reconciliation
prepareUpdateFrom: aNode to: anotherNode for: aHostNode

	| changes |
	changes := Dictionary new.
	anotherNode properties ifNotNil: [:p | p keysAndValuesDo: [:key :value | (value isGodotNode not and: [((aNode properties at: key ifAbsent: nil) grEqual: value) not]) ifTrue: [changes at: key put: (aNode serializePropValue: value for: react hostConfig)]]].
	^ changes ifEmpty: [nil]