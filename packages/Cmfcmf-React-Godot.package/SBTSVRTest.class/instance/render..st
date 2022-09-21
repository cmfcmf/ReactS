as yet unclassified
render: props

	| y |
	y := self useState: 0.1.
	
	^ (self godot: #Spatial) children: {
		(self godot: #DworphicARRoot) children: {
			(self godot: #ARVROrigin) children: {
				self godot: #ARVRCamera.
				(self godot: #ARVRController)
					children: {(self godot: #MeshInstance) mesh: ((self godot: #CubeMesh) size: (Vector3 x: 0.1 y: y get z: 0.1))};
					button_pressed: [:which | y set: [:a | a + 0.05]]}}}