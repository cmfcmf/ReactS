lifecycle
onCodeChanged

	self flag: #todo.
	"Only re-render updated components"
	elementTree allEntriesDo: [:entry | entry hooksDo: [:hook | hook onCodeChanged]].
	"Do not catch Halt exceptions. These should be handled as normal."
	[self render] on: Error do: [:error |
		"If an error occurrs during the render, also reset hooks and retry"
		"TODO: the hook recovery got lost in the refactor to store hooks in the tree directly"
		elementTree := CMFReactNodeTree new renderer: self.
		elementTree allEntriesDo: [:entry | entry hooksDo: [:hook | hook onCodeChanged]].
		[self render] on: Error ensure: [
			"finally { ... }"
			"If the error also occurrs when rendering a completely fresh instance, then mark the old one as 'destroyed', but resubscribe to code changes to possibly recover. Also restore hooks (after all, these cannot have caused the error!)."
			self outOfWorld.
			self subscribeToCodeChanges
			"hooks := oldHooks"]]