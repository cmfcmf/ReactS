hooks
useReducer: reducer initialState: initialState

	^ self getHook: CMFReactHookUseReducer IfAbsent: [:nodeId |
		CMFReactHookUseReducer new
			initState: initialState reducer: reducer onChange: [self reRenderNodeWithId: nodeId];
			yourself]