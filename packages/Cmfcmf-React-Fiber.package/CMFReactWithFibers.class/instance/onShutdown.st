as yet unclassified
onShutdown

	closed := true.
	currentRoot allEntriesDo: [:fiber | fiber hooksDo: [:hook | hook onComponentWasDestroyed]]