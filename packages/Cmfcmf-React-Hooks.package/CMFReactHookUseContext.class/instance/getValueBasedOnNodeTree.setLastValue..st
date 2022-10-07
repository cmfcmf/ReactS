private
getValueBasedOnNodeTree: aCMFReactNodeTree setLastValue: aBoolean

	| contextProviderNode newValue |
	contextProviderNode := node findNearestContextProviderFor: contextClass.
	newValue := contextProviderNode
		ifNil: [contextClass defaultValue]
		ifNotNil: [contextProviderNode props at: #value].
	aBoolean ifTrue: [lastValue := newValue].
	^ newValue