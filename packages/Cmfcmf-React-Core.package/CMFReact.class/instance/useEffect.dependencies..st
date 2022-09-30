hooks
useEffect: effect dependencies: dependencies

	| hook |
	hook := self getHook: CMFReactHookUseEffect IfAbsent: [:node | CMFReactHookUseEffect new].
	
	hook
		updateEffect: effect;
		updateDependencies: dependencies.
	
	hook dependenciesChanged ifTrue: [self addPendingEffect: hook].
	
	^ nil