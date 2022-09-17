as yet unclassified
testHook

	| hook |
	hook := CMFReactHookUseRef new
		initState: 123;
		yourself.
		
	self assert: hook get equals: 123.
	hook set: 456.
	self assert: hook get equals: 456