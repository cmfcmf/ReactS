as yet unclassified
cleanup

	effectHooks values concatenation do: #abandon.
	effectHooks removeAll.
	
	SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self.
	
	renderResult asOrderedCollection do: [:each | each
		setProperty: #errorOnDraw toValue: true;
		changed]