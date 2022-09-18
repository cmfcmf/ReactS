as yet unclassified
render: props

	| root hovered grabbed |
	root := (SBJavascript parseToplevel: '2 + 2')
		fullBounds;
		exportStructure.
	
	hovered := self useState: nil.
	grabbed := self useState: nil.
	
	^ SBTSHoveredContext asProviderNodeWithValue: hovered children: {
		SBTSGrabbedContext asProviderNodeWithValue: grabbed children: {
			(self godot: #Camera) current: true.
			SBTSGrabber3D asReactNodeBuilder build.
			SBTSBlock3D asReactNodeBuilder
				props: {#block -> root};
				build}}