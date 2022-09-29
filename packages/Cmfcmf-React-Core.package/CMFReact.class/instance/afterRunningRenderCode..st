rendering
afterRunningRenderCode: node

	| numHooks |
	"Must be called after the user-provided render code of a component has run."
	self assert: (CMFReact isValidNode: node).
	self assert: hookIndex notNil.
	
	numHooks := hookIndex - 1.
	
	hookIndex := nil.
	
	^ numHooks