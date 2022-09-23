lifecycle
onComponentWasDestroyed

	self allEntriesDo: [:entry | entry hooksDo: [:hook | hook onComponentWasDestroyed]]