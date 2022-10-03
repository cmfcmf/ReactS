as yet unclassified
useMemo: block dependencies: dependencies

	| hook |
	hook := currentFiber
		getHook: CMFReactHookUseMemo
		IfAbsent: [:node | CMFReactHookUseMemo new].
	hook
		updateBlock: block;
		updateDependencies: dependencies.
	^ hook get