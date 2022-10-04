reconciliation
prepareUpdateFrom: aNode to: anotherNode for: aHostNode

	| changes |
	changes := Dictionary new.
	(anotherNode propertiesToSetFor: react hostConfig) ifNotNil: [:p | p keysAndValuesDo: [:key :value | (aNode properties at: key ifAbsent: nil) == value ifFalse: [changes at: key put: (aNode serializePropValue: value for: react hostConfig)]]].
	^ changes ifEmpty: [nil]