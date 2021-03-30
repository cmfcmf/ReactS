as yet unclassified
render: props children: children
	
	^ PluggableButtonMorphPlus asReactNodeBuilder 
		init: [:m | m
			label: (props at: #label);
			action: (props at: #onClick)];
		build