as yet unclassified
useState: default

	^ currentFiber getHook: CMFReactHookUseState IfAbsent: [:fiber |
		CMFReactHookUseState new
			initState: default onChange: [:hook | self queueRenderFiber: hook fiber];
			yourself]