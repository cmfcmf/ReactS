running
Window: props

	^ CMFReactComponentWindow asElementBuilder
		children: {
			(#WindowChild asElementBuilder: self) build
		};
		build