as yet unclassified
workLoop

	[nextFiber notNil] whileTrue: [
		nextFiber := [nextFiber createNodeTreeAndReturnNextFor: self caughtError: nil]
			on: Error
			do: [:error |
				(nextFiber orParentSatisfying: [:fiber | fiber node handlesError])
					ifNotNil: [:fiber | fiber createNodeTreeAndReturnNextFor: self caughtError: error]
					ifNil: [error signal]]].
	^ self commitNodeChanges