as yet unclassified
orParentFiberSatisfying: aBlock

	^ (aBlock value: self)
		ifTrue: [self]
		ifFalse: [parent ifNotNil: [parent orParentFiberSatisfying: aBlock]]