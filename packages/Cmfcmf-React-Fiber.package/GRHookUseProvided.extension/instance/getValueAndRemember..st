*Cmfcmf-React-Fiber
getValueAndRemember: aBoolean

	| newValue validNamespaces |
	validNamespaces := OrderedCollection with: namespace.
	newValue := (fiber orParentSatisfying: [:entry |
		entry node class == GRUseProviderNamespace ifTrue: [validNamespaces add: entry node namespace].
		entry node class == GRProvider and: [(validNamespaces includes: entry node namespace) and: [entry node hasSymbol: symbol]]])
		ifNotNil: [:fiber | fiber node get: symbol]
		ifNil: [self error: ('no value for {1} provided in tree' format: {symbol})].
	aBoolean ifTrue: [lastValue := newValue].
	^ newValue