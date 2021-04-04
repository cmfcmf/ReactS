accessing
currentEntryOrNil

	^ currentChildPointer type == #index 
		ifTrue: [currentParentEntry childrenTreeNodes at: currentChildPointer index ifAbsent: [nil]]
		ifFalse: [currentParentEntry keyedChildrenTreeNodes at: currentChildPointer key ifAbsent: [nil]]