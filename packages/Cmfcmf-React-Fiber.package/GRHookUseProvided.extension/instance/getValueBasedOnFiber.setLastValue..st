*Cmfcmf-React-Fiber
getValueBasedOnFiber: aCMFReactNodeTree setLastValue: aBoolean

	| newValue validNamespaces |
	validNamespaces := OrderedCollection with: namespace.
	newValue := (fiber orParentSatisfying: [:entry |
		entry node class == GRUseProviderNamespace ifTrue: [validNamespaces add: entry node namespace].
		entry node class == GRProvider and: [(validNamespaces includes: entry node namespace) and: [entry node hasSymbol: symbol]]])
		ifNotNil: [:entry | entry get: symbol]
		ifNil: [self error: ('no value for {1} provided in tree' format: {symbol})].
	aBoolean ifTrue: [lastValue := newValue].
	^ newValue