initialize-release
initialize

	super initialize.
	
	callbacks := GRCallbackRegistry new.
	
	pendingUpdates := OrderedCollection new.
	pendingRefs := OrderedCollection new