lifecycle
outOfWorld

	self unsubscribeFromCodeChanges.

	elementTree allEntriesDo: [:entry | entry hooksDo: [:hook | hook onComponentWasDestroyed]].
	
	renderResult asOrderedCollection do: [:each | each
		setProperty: #errorOnDraw toValue: true;
		changed]