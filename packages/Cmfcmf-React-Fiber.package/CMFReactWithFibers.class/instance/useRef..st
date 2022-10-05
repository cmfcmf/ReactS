as yet unclassified
useRef: default

	^ currentFiber getHook: CMFReactHookUseRef IfAbsent: [:node |
		CMFReactHookUseRef new
			initState: default;
			yourself]