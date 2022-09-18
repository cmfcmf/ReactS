as yet unclassified
render: props

	| overlappingAreas hovered grabbed |
	overlappingAreas := self useState: {}.
	hovered := self useContext: SBTSHoveredContext.
	grabbed := self useContext: SBTSGrabbedContext.
	
	self useEffect: [overlappingAreas ifNotEmpty: [:areas | areas first = hovered get ifFalse: [hovered set: areas first]]].
	
	^ (self godot: #Area)
		button_pressed: [:button | button = #trigger ifTrue: [grabbed set: overlappingAreas first]];
		button_released: [:button | button = #trigger ifTrue: [grabbed set: nil]];
		area_entered: [:area | overlappingAreas set: [:list | list copyWith: area]];
		area_exited: [:area | overlappingAreas set: [:list | list copyWithout: area]];
		children: {
			(self godot: #CollisionShape) shape: ((self godot: #SphereShape)
				margin: 0.001;
				radius: 0.002)}