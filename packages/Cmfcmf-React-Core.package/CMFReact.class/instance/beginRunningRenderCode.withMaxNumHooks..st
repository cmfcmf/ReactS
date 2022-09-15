rendering
beginRunningRenderCode: node withMaxNumHooks: aNumber
	"Must be called before running the user-provided render code of a component. In React.js, this would be the code the user writes inside a function component."

	self assert: (CMFReact isValidNode: node).
	self assert: aNumber notNil.
	
	hookIndex := 1.
	maxNumHooks := aNumber