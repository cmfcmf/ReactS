rendering
render: react properties: aDictionary

	aDictionary keysAndValuesDo: [:key :value |
		value isGodotNode ifTrue: [aDictionary at: key put: (react renderNode: value forceReRender: false)].
		value isBlock ifTrue: [
			aDictionary at: key put: (react registerCallback: value)]].
	^ aDictionary