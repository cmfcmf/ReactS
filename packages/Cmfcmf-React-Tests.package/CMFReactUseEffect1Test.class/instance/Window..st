running
Window: props

	 ^ CMFReactComponentWindow asElementBuilder
		children: {
			(#Child asElementBuilder: self) build};
		build