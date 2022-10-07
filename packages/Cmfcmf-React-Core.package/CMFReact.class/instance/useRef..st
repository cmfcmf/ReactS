hooks
useRef: default

	^ self getHook: CMFReactHookUseRef ifAbsent: [:node |
		CMFReactHookUseRef new
			initState: default;
			yourself]