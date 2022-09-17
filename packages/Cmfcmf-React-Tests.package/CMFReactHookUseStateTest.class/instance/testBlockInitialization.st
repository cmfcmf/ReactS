as yet unclassified
testBlockInitialization

	CMFCurrentReact value: #foo during: [ | hook |
		self assert: CMFCurrentReact value notNil.
		
		hook := CMFReactHookUseState new
			initState: [
				"The block-based initialization must not be able to access other hooks during initialization, i.e., CMFCurrentReact should be nil"
				self assert: CMFCurrentReact value isNil.
				123] onChange: [];
			yourself.
			
		self assert: hook get equals: 123]