hooks
useState: default

	^ self getHook: CMFReactHookUseState IfAbsent: [:nodeId |
		CMFReactHookUseState new
			initState: default onChange: [self reRenderNodeWithId: nodeId];
			yourself]