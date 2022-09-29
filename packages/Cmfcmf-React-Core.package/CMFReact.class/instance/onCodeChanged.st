lifecycle
onCodeChanged

	self flag: #todo.
	"Only re-render updated components"
	"Do not catch Halt exceptions. These should be handled as normal."
	elementTree allEntriesDo: [:entry | entry hooksDo: [:hook | hook onCodeChanged]].
	[self render] on: CMFReactHooksChanged do: [:change |
		change renderInfo treeEntry resetHooks.
		change resume: (self runRenderCode: change node renderInfo: change renderInfo)]