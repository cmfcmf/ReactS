as yet unclassified
useState: default

	^ currentFiber getHook: CMFReactHookUseState IfAbsent: [:node |
		CMFReactHookUseState new
			initState: default onChange: [self queueRenderFiber: node];
			yourself]