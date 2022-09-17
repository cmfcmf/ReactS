as yet unclassified
testInitialization

	| hook |
	hook := CMFReactHookUseState new
		initState: 123 onChange: [];
		yourself.
		
	self assert: hook get equals: 123