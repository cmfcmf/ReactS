accessing
currentEntryOrNil

	^ currentChildPointer type == #index
		ifTrue: [
			currentParentEntry childrenTreeNodes
				at: currentChildPointer index
				ifAbsent: [nil]]
		ifFalse: [
			currentParentEntry childrenTreeNodes
				detect: [:entry | entry key = currentChildPointer key]
				ifNone: [nil]]