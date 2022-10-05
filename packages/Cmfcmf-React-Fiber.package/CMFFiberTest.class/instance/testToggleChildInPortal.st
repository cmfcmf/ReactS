tests - portal
testToggleChildInPortal

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
				optional ifTrue: [
					GRUseProviderNamespace
						namespace: #a
						children: {CMFReactNodePortal child: (self bubble: #Teleported) in: ref}].
				self bubble: #Child2}}].
	
	(root findTag: #Destination) findTag: #Teleported.
	
	optional := false.
	react reRenderAll.
	self should: [(root findTag: #Destination) findTag: #Teleported] raise: Error.
	
	optional := true.
	react reRenderAll.
	(root findTag: #Destination) findTag: #Teleported