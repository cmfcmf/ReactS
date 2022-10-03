as yet unclassified
prepareUpdateFrom: aNode to: anotherNode for: aHostNode

	| changes |
	changes := Dictionary new.
	anotherNode props ifNotNil: [:p | p keysAndValuesDo: [:key :value | (aNode props at: key ifAbsent: nil) == value ifFalse: [changes at: key put: value]]].
	^ changes ifEmpty: [nil]