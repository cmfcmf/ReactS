public
orParentSatisfying: aBlock

	^ (aBlock value: self)
		ifTrue: [node]
		ifFalse: [parent ifNotNil: [parent orParentSatisfying: aBlock]]