as yet unclassified
onCodeChanged

	self flag: #todo.
	"Only re-render updated components"
	currentRoot allFibersDo: [:fiber | fiber hooksDo: [:hook | hook onCodeChanged]].
	codeReload := true.
	[self reRenderAll] ensure: [codeReload := false]