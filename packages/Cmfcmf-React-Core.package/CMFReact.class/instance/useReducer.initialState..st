hooks
useReducer: reducer initialState: initialState

	| hook |
	hook := self getHook: CMFReactHookUseReducer ifAbsent: [:node |
		CMFReactHookUseReducer new
			initState: initialState reducer: reducer onChange: ["Transcript 
					showln: '';
					showln: 'Re-render node ', nodeId, ' due to useState -> set'.
				self halt."
			self queueRenderNode: node];
			yourself].
	hook reducer: reducer.
	^ hook