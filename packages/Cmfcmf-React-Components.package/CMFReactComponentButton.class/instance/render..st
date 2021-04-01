as yet unclassified
render: props
	
	^ PluggableButtonMorphPlus asReactNodeBuilder 
		init: [:m | m
			label: (props at: #label);
			action: (props at: #onClick);
			name: (props at: #name ifAbsent: [nil])];
		build