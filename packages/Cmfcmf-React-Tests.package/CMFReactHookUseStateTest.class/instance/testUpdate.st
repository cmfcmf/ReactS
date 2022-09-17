as yet unclassified
testUpdate

	| hook onChangeCalled |
	onChangeCalled := false.
	hook := CMFReactHookUseState new
		initState: 123 onChange: [onChangeCalled := true];
		yourself.
		
	self assert: hook get equals: 123.
	self deny: onChangeCalled.
		
	hook set: 123.
	self deny: onChangeCalled.
	
	hook set: 456.
	self assert: hook get equals: 456.
	self assert: onChangeCalled