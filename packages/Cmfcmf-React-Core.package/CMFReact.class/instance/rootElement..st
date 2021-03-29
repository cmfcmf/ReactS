as yet unclassified
rootElement: rootElement_

	rootElement := rootElement_.
	stateHooks := Dictionary new.
	effectHooks := Dictionary new.
	elementTree := CMFReactNodeTree new.
	
	"reactRoot := CMFReactRoot new.
	reactRoot onDelete: [self cleanup]."
	
	self render.
	
	SystemChangeNotifier uniqueInstance notify: self ofAllSystemChangesUsing: #render.
	
	^ rootMorph