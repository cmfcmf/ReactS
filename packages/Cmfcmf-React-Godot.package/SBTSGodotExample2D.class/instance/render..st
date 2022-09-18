as yet unclassified
render: props

	^ (self godot: #Button)
		text: 'Click me';
		pressed: [Transcript showln: 'pressed!']