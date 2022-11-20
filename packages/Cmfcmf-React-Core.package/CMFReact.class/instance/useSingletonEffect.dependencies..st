hooks
useSingletonEffect: effect dependencies: dependencies

	| hook |
	"effect that does not re-run on code reload"
	hook := self
		getHook: CMFReactHookUseEffect
		ifAbsent: [:node | CMFReactHookUseEffect new rerunOnCodeChange: false].
	
	hook
		updateEffect: effect;
		updateDependencies: dependencies.
	
	hook dependenciesChanged ifTrue: [self addPendingEffect: hook].
	
	^ nil