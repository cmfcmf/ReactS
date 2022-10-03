as yet unclassified
findNearestContextProviderFor: aCMFReactContextClass

	^ (node class == CMFReactNodeContextProvider and: [node elementClass == aCMFReactContextClass])
		ifTrue: [node]
		ifFalse: [parent ifNotNil: [parent findNearestContextProviderFor: aCMFReactContextClass]]