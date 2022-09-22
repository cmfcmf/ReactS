hooks
useEffect: effect dependencies: dependencies


	| hook |
	hook := self getHook: CMFReactHookUseEffect IfAbsent: [:nodeId |
		CMFReactHookUseEffect new
			initEffect: effect;
			yourself].
	
	hook
		updateDependencies: dependencies;
		initEffect: effect.
	
	^ hook