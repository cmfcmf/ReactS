hooks
useEffect: effect dependencies: dependencies

	| hook |
	hook := (effectHooks at: elementTree currentId ifAbsentPut: [OrderedCollection new]) 
			at: useEffectHookIndex 
			ifAbsentPut: [
				CMFReactHookUseEffect new
					initEffect: effect dependencies: dependencies react: self;
					yourself].
	useEffectHookIndex := useEffectHookIndex + 1.
	^ hook