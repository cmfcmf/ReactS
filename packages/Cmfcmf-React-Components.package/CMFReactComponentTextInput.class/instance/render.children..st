as yet unclassified
render: props children: children
	
	^ CMFReactNodeMorph factory: [CMFReactBaseTextInput new
		"minimumHeight: 0;
		minimumWidth: 0;
		layoutInset: 0;"
		acceptOnCR: true;
		hideScrollBarsIndefinitely;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		wrapFlag: false;
		setText: (props at: #value);
		onChange: [:value | (props at: #onChange) value: value asString];
		yourself]