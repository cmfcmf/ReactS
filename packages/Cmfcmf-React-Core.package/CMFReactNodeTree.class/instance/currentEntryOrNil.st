accessing
currentEntryOrNil

	^ currentParentEntry childrenTreeNodes at: currentChildIndex ifAbsent: [nil]