*Cmfcmf-React-Fiber
completeUpdateFiber: aFiber for: aState

	aFiber alternate ifNotNil: [aFiber alternate node container = aFiber node container ifFalse: [aFiber childrenDo: [:child | child addChange: CMFChangePlacementRecursive new]]]