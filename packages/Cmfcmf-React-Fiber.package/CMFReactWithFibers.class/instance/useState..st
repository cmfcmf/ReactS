as yet unclassified
useState: default

	^ currentFiber getHook: CMFReactHookUseState ifAbsent: [:fiber |
		CMFReactHookUseState new
			initState: default onChange: [:hook | self queueRenderFrom: hook];
			yourself]