private
contextClass: aCMFReactContextClass node: aTreeNode

	self assert: (aCMFReactContextClass isKindOf: CMFReactContext class).
	
	contextClass := aCMFReactContextClass.
	node := aTreeNode