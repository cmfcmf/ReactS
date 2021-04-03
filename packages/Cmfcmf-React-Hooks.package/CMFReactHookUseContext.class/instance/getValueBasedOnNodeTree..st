as yet unclassified
getValueBasedOnNodeTree: aCMFReactNodeTree

	| treeEntry contextProviderNode |	
	treeEntry := aCMFReactNodeTree rootEntry findTreeNodeById: nodeId.
	contextProviderNode := treeEntry findNearestContextProviderFor: contextClass.
	
	^ contextProviderNode ifNil: [contextClass defaultValue] ifNotNil: [contextProviderNode props at: #value]