running
setUp

	| morph |
	world := PasteUpMorph newWorldForProject: nil.
	morph := self render.
	world addMorph: morph.
	self wantsToTest: morph.