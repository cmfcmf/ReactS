as yet unclassified
useSingletonEffect: effect dependencies: dependencies

	| hook |
	hook := currentFiber
		getHook: CMFReactHookUseEffect
		ifAbsent: [:node | CMFReactHookUseEffect new rerunOnCodeChange: false].
	hook
		updateEffect: effect;
		updateDependencies: dependencies.
	hook dependenciesChanged ifTrue: [self addPendingEffect: hook].
	^ nil