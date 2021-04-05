lifecycle
unsubscribeFromCodeChanges

	SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self.
	isSubscribedToCodeChanges := false