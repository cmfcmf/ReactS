hooks
useReducer: reducer initialState: initialState

	| hook |
	hook := self getHook: CMFReactHookUseReducer IfAbsent: [:nodeId |
		CMFReactHookUseReducer new
			initState: initialState onChange: [self reRenderNodeWithId: nodeId];
			yourself].
	hook reducer: reducer.
	^ hook