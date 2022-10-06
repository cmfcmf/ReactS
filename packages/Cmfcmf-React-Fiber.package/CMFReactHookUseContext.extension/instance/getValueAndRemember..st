*Cmfcmf-React-Fiber
getValueAndRemember: aBoolean

	| contextProviderNode newValue |
	contextProviderNode := fiber findNearestContextProviderFor: contextClass.
	newValue := contextProviderNode
		ifNil: [contextClass defaultValue]
		ifNotNil: [contextProviderNode props at: #value].
	aBoolean ifTrue: [lastValue := newValue].
	^ newValue