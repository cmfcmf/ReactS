hooks
useState: default

	^ self getHook: CMFReactHookUseState IfAbsent: [:node |
		CMFReactHookUseState new
			initState: default onChange: [self reRenderNode: node];
			yourself]