private
resetCurrentParentEntryAndChildPointerAfter: aBlock

	| pointer entry |
	entry := currentParentEntry.
	pointer := currentChildPointer.
	
	^ aBlock ensure: [
		currentParentEntry := entry. 
		currentChildPointer := pointer.
		self assert: (rootEntry findTreeNodeById: entry id) == entry]