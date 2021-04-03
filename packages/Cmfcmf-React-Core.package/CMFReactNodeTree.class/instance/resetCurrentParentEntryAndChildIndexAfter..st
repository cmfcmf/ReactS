private
resetCurrentParentEntryAndChildIndexAfter: aBlock

	| index entry |
	entry := currentParentEntry.
	index := currentChildIndex.
	
	^ aBlock ensure: [
		currentParentEntry := entry. 
		currentChildIndex := index.
		self assert: (rootEntry findTreeNodeById: entry id) == entry]