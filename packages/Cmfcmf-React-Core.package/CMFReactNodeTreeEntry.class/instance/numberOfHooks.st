accessing
numberOfHooks

	^ hooks ifNil: [0] ifNotNil: [hooks size]