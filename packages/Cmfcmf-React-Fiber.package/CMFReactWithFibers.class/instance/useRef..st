as yet unclassified
useRef: default

	^ currentFiber getHook: CMFReactHookUseRef ifAbsent: [:node |
		CMFReactHookUseRef new
			initState: default;
			yourself]