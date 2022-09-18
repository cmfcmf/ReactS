as yet unclassified
render: props

	| count |
	count := self useState: 0.
	
	^ (self godot: #VBoxContainer) children: {
		(self godot: #Button)
			text: 'Click me ', count get asString;
			pressed: [count set: [:c | c + 1]].
		(self godot: #Button)
			text: 'Reset';
			pressed: [count set: 0]}, ((1 to: count get) collect: [:i | (self godot: #Label) text: 'Hello world!'])