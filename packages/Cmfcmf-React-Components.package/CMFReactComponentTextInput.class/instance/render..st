as yet unclassified
render: props
	
	^ CMFReactBaseTextInput asReactNodeBuilder
		create: [:c | 
			c new
				minimumHeight: 20;
				"minimumWidth: 0;
				layoutInset: 0;"
				acceptOnCR: true;
				hideScrollBarsIndefinitely;
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				wrapFlag: false;
				yourself];
	 	onRender: [:m | "self halt." m
			setText: (props at: #value);
			onChange: [:value | (props at: #onChange) value: value asString];
			name: (props at: #name ifAbsent: [nil])];
		build