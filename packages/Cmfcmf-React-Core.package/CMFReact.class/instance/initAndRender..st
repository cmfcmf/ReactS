initialize-release
initAndRender: rootElement_

	rootElement := rootElement_.
	hooks := OrderedDictionary new.
	elementTree := CMFReactNodeTree new.
	
	^ self render