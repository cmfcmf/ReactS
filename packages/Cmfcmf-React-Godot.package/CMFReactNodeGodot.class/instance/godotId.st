accessing
godotId

	^ godotId ifNil: [godotId := CMFReactGodot nextGodotId]