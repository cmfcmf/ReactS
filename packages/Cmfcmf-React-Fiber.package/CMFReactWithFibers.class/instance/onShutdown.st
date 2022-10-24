as yet unclassified
onShutdown

	currentRoot allEntriesDo: [:fiber | fiber hooksDo: [:hook | hook onComponentWasDestroyed]]