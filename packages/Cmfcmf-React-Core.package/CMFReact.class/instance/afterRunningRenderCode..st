rendering
afterRunningRenderCode: node
	"Must be called after the user-provided render code of a component has run."

	| numHooks |
	self assert: (CMFReact isValidNode: node).
	self assert: hookIndex notNil.
	self assert: maxNumHooks notNil.
	
	numHooks := hookIndex - 1.
	
	hookIndex := nil.
	maxNumHooks := nil.
	
	^ numHooks