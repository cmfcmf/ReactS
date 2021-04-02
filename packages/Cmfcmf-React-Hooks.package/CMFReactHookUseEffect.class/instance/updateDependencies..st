as yet unclassified
updateDependencies: newDependencies

	hasRun ifFalse: [mustRun := true] ifTrue: [
		"sanity check: number of dependencies must not change between re-renders."
		dependencies 
			ifNil: [self assert: newDependencies isNil]
			ifNotNil: [self assert: dependencies size == newDependencies size].
		
		"check if we must run"
		newDependencies 
			ifNil: ["always run when there are no dependencies"
				mustRun := true]
			ifNotNil: [
				newDependencies 
					ifEmpty: ["never run when dependencies are empty"
						mustRun := false]
					ifNotEmpty: ["run if one of the dependencies changed"
						mustRun := (dependencies with: newDependencies) anySatisfy: [:old :new | old ~~ new]]]].

	dependencies := newDependencies