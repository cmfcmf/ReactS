reconciliation
reconcileChildren: aCollection for: aState

	| previousNewFiber resultingFirstChild oldFiber nextOldFiber lastPlacedIndex newIndex newFiber existingChildren break |
	previousNewFiber := nil.
	resultingFirstChild := nil.
	oldFiber := self alternate ifNotNil: #child.
	nextOldFiber := nil.
	lastPlacedIndex := 1.
	newIndex := 1.
	break := false.
	
	[break not and: [oldFiber notNil and: [newIndex <= aCollection size]]] whileTrue: [
		oldFiber index > newIndex
			ifTrue: [
				nextOldFiber := oldFiber.
				oldFiber := nil]
			ifFalse: [nextOldFiber := oldFiber sibling].
		
		newFiber := oldFiber updateSlot: (aCollection at: newIndex) parent: self.
		newFiber
			ifNil: [
				oldFiber ifNil: [oldFiber := nextOldFiber].
				break := true]
			ifNotNil: [
				(oldFiber notNil and: [newFiber alternate isNil]) ifTrue: [self addChange: (CMFChangeChildDeletion new fiber: oldFiber)].
				
				lastPlacedIndex := self placeChild: newFiber last: lastPlacedIndex new: newIndex.
				previousNewFiber
					ifNil: [resultingFirstChild := newFiber]
					ifNotNil: [previousNewFiber sibling: newFiber].
				previousNewFiber := newFiber.
				oldFiber := nextOldFiber.
				newIndex := newIndex + 1]].
	
	" reached the end, can delete the remaining "
	newIndex > aCollection size ifTrue: [
		[oldFiber] whileNotNil: [
			self addChange: (CMFChangeChildDeletion new fiber: oldFiber).
			oldFiber := oldFiber sibling].
		^ resultingFirstChild].
	
	" no more existing children "
	oldFiber ifNil: [
		newIndex to: aCollection size do: [:index |
			newFiber := CMFFiber new
				node: (aCollection at: index);
				parent: self.
			lastPlacedIndex := self placeChild: newFiber last: lastPlacedIndex new: index.
			previousNewFiber
				ifNil: [resultingFirstChild := newFiber]
				ifNotNil: [previousNewFiber sibling: newFiber].
			previousNewFiber := newFiber].
		^ resultingFirstChild].
	
	existingChildren := Dictionary new.
	[oldFiber] whileNotNil: [
		existingChildren at: (oldFiber key ifNil: [oldFiber index]) put: oldFiber.
		oldFiber := oldFiber sibling].
	
	newIndex to: aCollection size do: [:index | | newNode |
		newNode := aCollection at: index.
		oldFiber := existingChildren at: (newNode key ifNil: [index]) ifAbsent: [nil].
		newFiber := oldFiber
			ifNil: [
				CMFFiber new
					parent: self;
					node: newNode]
			ifNotNil: [oldFiber reuseFor: newNode parent: self].
		
		newFiber ifNotNil: [
			newFiber alternate ifNotNil: [" we chose to reuse the fiber, so we should not delete it later on "
			existingChildren removeKey: (newFiber key ifNil: [oldFiber index])].
			lastPlacedIndex := self placeChild: newFiber last: lastPlacedIndex new: index.
			previousNewFiber
				ifNil: [resultingFirstChild := newFiber]
				ifNotNil: [previousNewFiber sibling: newFiber].
			previousNewFiber := newFiber]].
	
	existingChildren do: [:fiber | self addChange: (CMFChangeChildDeletion new fiber: fiber)].
	
	^ resultingFirstChild