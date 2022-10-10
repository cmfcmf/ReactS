as yet unclassified
doIn: aFiber for: aState

	aFiber node ref ifNotNil: [aFiber node ref value: aFiber output] ifNil: [
		"is it still me who is in that ref or has someone else already taken the place?"
		aFiber alternate node ref get = aFiber output ifTrue: [aFiber alternate node ref value: nil]]