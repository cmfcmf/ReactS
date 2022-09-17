as yet unclassified
testHook

	CMFCurrentReact value: #foo during: [| hook dispatch onChangeCalled |
		self assert: CMFCurrentReact value notNil.
		onChangeCalled := false.
		
		hook := CMFReactHookUseReducer new
			initState: 123 reducer: [:state :action |
				"The reducer must not be able to access other hooks, i.e., CMFCurrentReact should be nil"
				self assert: CMFCurrentReact value isNil.
				action caseOf: {
					[#reset] -> [0].
					[#inc] -> [state + 1].
					[#dec] -> [state - 1].
				} otherwise: [state]] onChange: [onChangeCalled := true];
			yourself.
			
		self assert: hook get equals: 123.
		self deny: onChangeCalled.
	
		"Check that the identity of the dispatcher remains the same"
		dispatch := hook dispatch.
		self assert: dispatch identical: hook dispatch.
	
		dispatch value: #foo.
		self assert: hook get equals: 123.
		self assert: dispatch identical: hook dispatch.
		self deny: onChangeCalled.
	
		dispatch value: #inc.
		self assert: hook get equals: 124.
		self assert: dispatch identical: hook dispatch.
		self assert: onChangeCalled.
	
		dispatch value: #dec.
		self assert: hook get equals: 123.
		self assert: dispatch identical: hook dispatch.
	
		dispatch value: #reset.
		self assert: hook get equals: 0.
		self assert: dispatch identical: hook dispatch.
	
		hook reducer: [:state :action | 
			"The reducer must not be able to access other hooks, i.e., CMFCurrentReact should be nil"
			self assert: CMFCurrentReact value isNil.
			action caseOf: {
				[#foo] -> [456].
			} otherwise: [state]].
	
		dispatch value: #foo.
		self assert: hook get equals: 456.
		self assert: dispatch identical: hook dispatch]