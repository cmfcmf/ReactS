changes
commitNodeChangesFor: aState

	changes ifNotNil: [
		changes do: [:change | change doIn: self for: aState].
		changes := nil].
	
	self child ifNotNil: [self child commitNodeChangesFor: aState].
	self sibling ifNotNil: [self sibling commitNodeChangesFor: aState]