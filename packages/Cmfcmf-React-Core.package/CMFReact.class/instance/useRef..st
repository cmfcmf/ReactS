hooks
useRef: default

	^ self getHook: CMFReactHookUseRef IfAbsent: [:node |
		CMFReactHookUseRef new
			initState: default;
			yourself]