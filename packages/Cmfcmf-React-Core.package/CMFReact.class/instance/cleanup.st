as yet unclassified
cleanup

	effectHooks values concatenation do: #abandon.
	effectHooks removeAll.
	
	SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self