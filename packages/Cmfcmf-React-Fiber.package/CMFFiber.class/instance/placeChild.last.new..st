reconciliation
placeChild: aFiber last: aLastNumber new: aNewNumber

	| current |
	aFiber index: aNewNumber.
	
	current := aFiber alternate.
	current
		ifNotNil: [ | oldIndex |
			oldIndex := current index.
			oldIndex < aNewNumber
				ifTrue: [
					" moved to a new position "
					aFiber addChange: CMFChangePlacement new.
					^ aLastNumber]
				ifFalse: [" position still free "
				^ oldIndex]]
		ifNil: [
			" inserted new "
			aFiber addChange: CMFChangePlacement new.
			^ aLastNumber]