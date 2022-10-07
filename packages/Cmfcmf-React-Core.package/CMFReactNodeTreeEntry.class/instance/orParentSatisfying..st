public
orParentSatisfying: aBlock

	^ (aBlock value: self)
		ifTrue: [self]
		ifFalse: [parent ifNotNil: [parent orParentSatisfying: aBlock]]