as yet unclassified
render: props

	| count rootRef |
	count := self useState: 0.
	rootRef := self useRef: nil.
	self
		useEffect: [ | viewport |
			GDCurrentSession value
				callOnGlobal: 'ARVRServer'
				method: 'find_interface'
				arguments: {'OpenXR'}.
			viewport := GDCurrentSession value
				callOn: rootRef get
				method: 'get_viewport'
				arguments: {}.
			nil]
		dependencies: {count get}.
	
	^ (self godot: #VBoxContainer)
		ref: rootRef;
		children: {
			(self godot: #Button)
				text: 'Click me ', count get asString;
				pressed: [count set: [:c | c + 1]].
			(self godot: #Button)
				text: 'Reset';
				pressed: [count set: 0].
			(self godot: #CollisionShape2D) shape: ((self godot: #RectangleShape2D) extents: (Vector2 x: 100 * count get y: 30))}, ((1 to: count get) collect: [:i | (self godot: #Label) text: 'Hello world!'])