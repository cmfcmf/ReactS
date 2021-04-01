*Cmfcmf-React-Tests
dragBy: aPoint

	self mouseDown.
	self morphs do: [ :morph |
		self hand newMouseFocus: morph.
		morph handleEvent: (
			MouseMoveEvent new
				setType: #mouseMove
				startPoint: morph center
				endPoint: morph center + aPoint
				trail: #()
				buttons: MTFMorphWrapper leftButton + 0
				hand: self hand
				stamp: Time millisecondClockValue)].
	self mouseUp