lifecycle
outOfWorld

	self unsubscribeFromCodeChanges.

	hooks values concatenation do: #onComponentWasDestroyed.
	
	renderResult asOrderedCollection do: [:each | each
		setProperty: #errorOnDraw toValue: true;
		changed]