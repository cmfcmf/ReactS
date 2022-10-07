as yet unclassified
useMemo: block dependencies: dependencies

	| hook |
	hook := currentFiber
		getHook: CMFReactHookUseMemo
		ifAbsent: [:node | CMFReactHookUseMemo new].
	hook
		updateBlock: block;
		updateDependencies: dependencies.
	^ hook get