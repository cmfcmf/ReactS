as yet unclassified
contextClass: aCMFReactContextClass nodeId: aString

	self assert: (aCMFReactContextClass isKindOf: CMFReactContext class).
	self assert: aString isString.
	
	contextClass := aCMFReactContextClass.
	nodeId := aString