as yet unclassified
testSetter

	| hook onChangeCalled setter |
	onChangeCalled := false.
	hook := CMFReactHookUseState new
		initState: 123 onChange: [onChangeCalled := true];
		yourself.
		
	self assert: hook get equals: 123.
	self deny: onChangeCalled.
	
	"Check that the identity of the setter remains the same"
	setter := hook setter.
	self assert: setter identical: hook setter.
	
	setter value: 456.
	self assert: hook get equals: 456.
	self assert: onChangeCalled