initialize-release
initAndRender: rootElement_

	rootElement := rootElement_.
	hooks := OrderedDictionary new.
	elementTree := CMFReactNodeTree new renderer: self.
	
	^ self render