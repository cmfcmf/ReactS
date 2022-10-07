tests - portal
testNestedPortal

	self openComponentBlock: [ | ref |
		ref := CMFReact useRef: nil.
		{
			(self bubble: #Destination)
				key: #destination;
				ref: ref.
			(self bubble: #Parent) children: {
				self bubble: #Child1.
				(self bubble: #Nested) children: {CMFReactNodePortal child: (self bubble: #Teleported) in: ref}.
				self bubble: #Child2}}].
	(root findTag: #Destination) findTag: #Teleported.
	self should: [(root findTag: #Parent) findTag: #Teleported] raise: Error