as yet unclassified
initAndRender: rootElement_

	rootElement := rootElement_.
	
	hooks := OrderedDictionary new.
		
	SystemChangeNotifier uniqueInstance notify: self ofAllSystemChangesUsing: #codeChanged:.
	
	elementTree := CMFReactNodeTree new.
	^ self render