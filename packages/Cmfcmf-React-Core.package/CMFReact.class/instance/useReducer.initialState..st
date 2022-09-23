hooks
useReducer: reducer initialState: initialState

	| hook |
	hook := self getHook: CMFReactHookUseReducer IfAbsent: [:node |
		CMFReactHookUseReducer new
			initState: initialState reducer: reducer onChange: [
				"Transcript 
					showln: '';
					showln: 'Re-render node ', nodeId, ' due to useState -> set'.
				self halt."
				self reRenderNode: node];
			yourself].
	hook reducer: reducer.
	^ hook