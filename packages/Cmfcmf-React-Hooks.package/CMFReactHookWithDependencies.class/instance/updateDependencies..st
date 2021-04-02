as yet unclassified
updateDependencies: newDependencies

	dependenciesInitialized 
		ifFalse: [dependenciesChanged := dependenciesInitialized := true] 
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
					dependenciesChanged := true]
				ifNotNil: [
					newDependencies 
						ifEmpty: ["never run when dependencies are empty"
							dependenciesChanged := false]
						ifNotEmpty: ["run if one of the dependencies changed"
							dependenciesChanged := false.
							dependencies withIndexDo: [:old :i | | new |
								new := newDependencies at: i.
								old ~~ new ifTrue: [dependenciesChanged := true]]]]].

	dependencies := newDependencies