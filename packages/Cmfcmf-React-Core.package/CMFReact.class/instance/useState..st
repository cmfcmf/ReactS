hooks
useState: default

	^ self getHook: CMFReactHookUseState ifAbsent: [:node |
		CMFReactHookUseState new
			initState: default onChange: [self queueRenderNode: node];
			yourself]