hooks
useEffect: effect dependencies: dependencies


	^ self getHook: CMFReactHookUseEffect IfAbsent: [:nodeId |
		CMFReactHookUseEffect new
			initEffect: effect dependencies: dependencies;
			yourself]