lifecycle
codeChanged: event

	event isDoIt ifTrue: [^ self].
	"Transcript showln: event."
	
	"Re-render during the next 'tick' so that errors do not break saving a method"
	Project current addDeferredUIMessage: [
		"Always reset the element tree for now"
		elementTree := CMFReactNodeTree new renderer: self.
		self flag: #todo. "Only re-render updated components"
		
		"Do not catch Halt exceptions. These should be handled as normal."
		[self render] on: Error do: [:error | 
			"If an error occurrs during the render, also reset hooks and retry"
			"TODO: the hook recovery got lost in the refactor to store hooks in the tree directly"
			"oldHooks := hooks.
			hooks := OrderedDictionary new."
			elementTree := CMFReactNodeTree new renderer: self.
			[self render] on: Error ensure: ["finally { ... }"
				"If the error also occurrs when rendering a completely fresh instance, then mark the old one as 'destroyed', but resubscribe to code changes to possibly recover. Also restore hooks (after all, these cannot have caused the error!)."
				self outOfWorld. 
				self subscribeToCodeChanges.
				"hooks := oldHooks"]]]