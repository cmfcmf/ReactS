as yet unclassified
isValidRenderResult: anObject

	^ anObject class == CMFReactNodeGodot or: [anObject class == CMFReactNodeGodotResource or: [anObject isSequenceable and: [anObject allSatisfy: [:o | o class == CMFReactNodeGodot]]]]