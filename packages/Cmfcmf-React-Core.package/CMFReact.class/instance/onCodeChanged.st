lifecycle
onCodeChanged

	self flag: #todo.
	"Only re-render updated components"
	elementTree allEntriesDo: [:entry | entry hooksDo: [:hook | hook onCodeChanged]].
	[self render] on: CMFReactHooksChanged do: [:change |
		change renderInfo treeEntry resetHooks.
		change resume: (self runRenderCode: change node renderInfo: change renderInfo)]
