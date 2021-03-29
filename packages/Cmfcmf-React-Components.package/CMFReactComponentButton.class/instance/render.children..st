as yet unclassified
render: props children: children
	
	^ CMFReactNodeMorph factory: [PluggableButtonMorphPlus new
		label: (props at: #label);
		action: (props at: #onClick);
		yourself]