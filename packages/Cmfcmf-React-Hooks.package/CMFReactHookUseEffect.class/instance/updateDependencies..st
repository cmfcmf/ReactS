as yet unclassified
updateDependencies: newDependencies

	hasRun 
		ifFalse: [mustRun := true] 
		ifTrue: [
			"sanity check: number of dependencies must not change between re-renders."
			dependencies 
				ifNil: [self assert: newDependencies isNil]
				ifNotNil: [self assert: dependencies size == newDependencies size].
			
			"sanity check: hooks must not be passed as dependencies"
			newDependencies ifNotNil: [
				newDependencies do: [:each | self assert: (each isKindOf: CMFReactHook) not]].
			
			"check if we must run"
			newDependencies 
				ifNil: ["always run when there are no dependencies"
					mustRun := true]
				ifNotNil: [
					newDependencies 
						ifEmpty: ["never run when dependencies are empty"
							mustRun := false]
						ifNotEmpty: ["run if one of the dependencies changed"
							mustRun := false.
							dependencies withIndexDo: [:old :i | | new |
								new := newDependencies at: i.
								old ~~ new ifTrue: [mustRun := true]]]]].

	dependencies := newDependencies