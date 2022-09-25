lifecycle
outOfWorld

	self unsubscribeFromCodeChanges.

	elementTree allEntriesDo: [:entry | entry hooksDo: [:hook | hook onComponentWasDestroyed]].
	
	renderResult asOrderedCollection do: [:each |
		each isMorph ifTrue: [
			each
				setProperty: #errorOnDraw toValue: true;
				changed]]