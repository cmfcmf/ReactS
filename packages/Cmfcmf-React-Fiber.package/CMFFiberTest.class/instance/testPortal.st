tests - portal
testPortal

	self openComponentBlock: [ | portalRef |
		portalRef := CMFReact useRef: nil.
		(self bubble: #Parent) children: {
			(self bubble: #Destination) ref: portalRef.
			CMFReactNodePortal child: (self bubble: #Teleported) in: portalRef}].
	self shouldnt: [(root findTag: #Destination) findTag: #Teleported] raise: Error