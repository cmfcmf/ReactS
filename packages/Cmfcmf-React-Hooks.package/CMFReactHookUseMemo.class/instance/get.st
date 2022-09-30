as yet unclassified
get

	dependenciesChanged ifTrue: [
		"reset to something invalid so that we trigger an error if get is accessed without calling updateDependencies first."
		dependenciesChanged := nil.
		"do not allow nested hooks"
		CMFCurrentReact value: nil during: [value := block value]].
	
	^ value