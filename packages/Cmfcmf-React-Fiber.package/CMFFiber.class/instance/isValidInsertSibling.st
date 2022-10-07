as yet unclassified
isValidInsertSibling

	^ self node isValidInsertSibling and: [self changes isNil or: [self changes noneSatisfy: [:change | change class == CMFChangePlacement]]]