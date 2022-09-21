as yet unclassified
nextGodotId

	CurrentGodotId ifNil: [CurrentGodotId := 0].
	CurrentGodotId := CurrentGodotId + 1.
	CurrentGodotId > 900000000 ifTrue: [CurrentGodotId := 0].
	^ CurrentGodotId