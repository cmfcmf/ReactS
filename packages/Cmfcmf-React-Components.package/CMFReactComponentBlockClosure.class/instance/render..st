rendering
render: props
	
	^ (props at: #__block) cull: (props copy removeKey: #__block; yourself)