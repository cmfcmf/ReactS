as yet unclassified
testBlockUpdate

	CMFCurrentReact value: #foo during: [ | hook onChangeCalled |
		onChangeCalled := false.
		hook := CMFReactHookUseState new
			initState: 123 onChange: [onChangeCalled := true];
			yourself.
			
		self assert: hook get equals: 123.
		self deny: onChangeCalled.
	
		self assert: CMFCurrentReact value notNil.
		hook set: [:old |
			"The block-based setter must not be able to access other hooks inside the setter, i.e., CMFCurrentReact should be nil"
			self assert: CMFCurrentReact value isNil.
			old + 1].
		self assert: hook get equals: 124.
		self assert: onChangeCalled]