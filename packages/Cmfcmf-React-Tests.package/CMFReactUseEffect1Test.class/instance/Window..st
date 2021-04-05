running
Window: props

	 ^ CMFReactComponentWindow asReactNodeBuilder
		children: {
			(#Child asReactNodeBuilder: self) build};
		build