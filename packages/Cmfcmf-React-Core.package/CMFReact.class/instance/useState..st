hooks
useState: default

	^ self getHook: CMFReactHookUseState IfAbsent: [:node |
		CMFReactHookUseState new
			initState: default onChange: [self queueRenderNode: node];
			yourself]