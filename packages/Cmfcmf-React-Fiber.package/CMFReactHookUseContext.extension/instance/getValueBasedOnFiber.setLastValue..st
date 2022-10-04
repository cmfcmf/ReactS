*Cmfcmf-React-Fiber
getValueBasedOnFiber: aCMFReactNodeTree setLastValue: aBoolean

	| contextProviderNode newValue |
	contextProviderNode := fiber findNearestContextProviderFor: contextClass.
	newValue := contextProviderNode
		ifNil: [contextClass defaultValue]
		ifNotNil: [contextProviderNode props at: #value].
	aBoolean ifTrue: [lastValue := newValue].
	^ newValue