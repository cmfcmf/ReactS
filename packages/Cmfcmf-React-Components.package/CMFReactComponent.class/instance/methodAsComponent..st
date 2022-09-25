rendering
methodAsComponent: aSymbol

	^ CMFReactNodeComponent new
		elementClass: self class;
		selector: aSymbol;
		props: Dictionary new