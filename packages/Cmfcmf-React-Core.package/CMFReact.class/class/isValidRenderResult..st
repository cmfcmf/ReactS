testing
isValidRenderResult: anObject

	^ anObject isMorph or: [anObject isSequenceable and: [anObject allSatisfy: #isMorph]]