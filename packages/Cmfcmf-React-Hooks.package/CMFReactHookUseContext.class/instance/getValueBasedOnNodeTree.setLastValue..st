private
getValueBasedOnNodeTree: aCMFReactNodeTree setLastValue: aBoolean

	| treeEntry contextProviderNode newValue |	
	treeEntry := aCMFReactNodeTree rootEntry findTreeNodeById: nodeId.
	contextProviderNode := treeEntry findNearestContextProviderFor: contextClass.
	
	newValue := contextProviderNode ifNil: [contextClass defaultValue] ifNotNil: [contextProviderNode props at: #value].
	aBoolean ifTrue: [lastValue := newValue].
	^ newValue