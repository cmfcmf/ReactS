lifecycle
subscribeToCodeChanges
	
	SystemChangeNotifier uniqueInstance notify: self ofAllSystemChangesUsing: #codeChanged:.
	isSubscribedToCodeChanges := true