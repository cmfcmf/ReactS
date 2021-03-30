as yet unclassified
render: props children: children
	
	^ CMFReactNodeMorphBuilder new
		create: [CMFReactBaseTextInput new
			minimumHeight: 20;
			"minimumWidth: 0;
			layoutInset: 0;"
			acceptOnCR: true;
			hideScrollBarsIndefinitely;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			wrapFlag: false;
			yourself];
	 	init: [:m | "self halt." m
			setText: (props at: #value);
			onChange: [:value | (props at: #onChange) value: value asString]]; 
		build