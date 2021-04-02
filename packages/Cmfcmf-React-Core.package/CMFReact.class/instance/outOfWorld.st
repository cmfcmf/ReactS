lifecycle
outOfWorld

	hooks values concatenation do: #onComponentWasDestroyed.
	
	SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self.
	
	renderResult asOrderedCollection do: [:each | each
		setProperty: #errorOnDraw toValue: true;
		changed]