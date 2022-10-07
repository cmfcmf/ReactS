tests - portal
testOptionalChildInNestedPortal

	| optional |
	optional := true.
	self openComponentBlock: [ | ref |
		ref := CMFReact useRef: nil.
		{
			(self bubble: #Destination)
				key: #destination;
				ref: ref.
			(self bubble: #Parent) children: {
				self bubble: #Child1.
				optional
					ifTrue: [(self bubble: #Nested) children: {CMFReactNodePortal child: (self bubble: #Teleported) in: ref}]
					ifFalse: [].
				self bubble: #Child2}}].
	
	(root findTag: #Destination) findTag: #Teleported.
	
	optional := false.
	react reRenderAll.
	self should: [(root findTag: #Destination) findTag: #Teleported] raise: Error