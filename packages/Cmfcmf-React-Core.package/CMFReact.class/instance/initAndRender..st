as yet unclassified
initAndRender: rootElement_

	rootElement := rootElement_.
	
	stateHooks := Dictionary new.
	effectHooks := Dictionary new.
		
	SystemChangeNotifier uniqueInstance notify: self ofAllSystemChangesUsing: #codeChanged:.
	
	elementTree := CMFReactNodeTree new.
	^ self render