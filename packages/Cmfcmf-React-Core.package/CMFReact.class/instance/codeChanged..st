lifecycle
codeChanged: event

	event isDoIt ifTrue: [^ self].
	"Transcript showln: event."
	
	"Re-render during the next 'tick' so that errors do not break saving a method"
	Project current addDeferredUIMessage: [
		"Always reset the element tree for now"
		elementTree := CMFReactNodeTree new.
		self flag: #todo. "Only re-render updated components"
		
		"Do not catch Halt exceptions. These should be handled as normal."
		[self render] on: Error do: [:error | | oldHooks |
			"If an error occurrs during the render, also reset hooks and retry"
			oldHooks := hooks.
			hooks := OrderedDictionary new.
			elementTree := CMFReactNodeTree new.
			[self render] on: Error do: [:nestedError |
				"If the error also occurrs when rendering a completely fresh instance, then mark the old one as 'destroyed', but resubscribe to code changes to possibly recover. Also show the error to the user."	
				self outOfWorld. 
				self subscribeToCodeChanges.
				nestedError signal]]]