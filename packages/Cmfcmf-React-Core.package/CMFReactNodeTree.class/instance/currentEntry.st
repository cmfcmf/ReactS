accessing
currentEntry

	^ currentChildPointer type == #index 
		ifTrue: [currentParentEntry childrenTreeNodes at: currentChildPointer index]
		ifFalse: [currentParentEntry keyedChildrenTreeNodes at: currentChildPointer key]