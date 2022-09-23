initialize-release
initAndRender: rootElement_

	rootElement := rootElement_.
	elementTree := CMFReactNodeTree new renderer: self.
	
	^ self render