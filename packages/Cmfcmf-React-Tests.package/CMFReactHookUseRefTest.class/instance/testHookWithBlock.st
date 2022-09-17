as yet unclassified
testHookWithBlock

	"useRef does not execute blocks"
	| hook value |
	value := [123].
	hook := CMFReactHookUseRef new
		initState: value;
		yourself.
		
	self assert: hook get equals: value.
	
	value := [456].
	hook set: value.
	self assert: hook get equals: value