hooks
useRef: default

	^ self getHook: CMFReactHookUseRef IfAbsent: [:nodeId |
		CMFReactHookUseRef new
			initState: default;
			yourself]