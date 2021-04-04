hooks
useReducer: reducer initialState: initialState

	| hook |
	hook := self getHook: CMFReactHookUseReducer IfAbsent: [:nodeId |
		CMFReactHookUseReducer new
			initState: initialState onChange: [
				Transcript 
					showln: '';
					showln: 'Re-render node ', nodeId, ' due to useState -> set'.
				"self halt."
				self reRenderNodeWithId: nodeId];
			yourself].
	hook reducer: reducer.
	^ hook