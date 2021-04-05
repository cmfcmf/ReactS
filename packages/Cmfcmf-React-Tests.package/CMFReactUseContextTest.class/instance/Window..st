running
Window: props

	^ CMFReactComponentWindow asReactNodeBuilder
		children: {
			(#WindowChild asReactNodeBuilder: self) build
		};
		build