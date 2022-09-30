hooks
useMemo: block dependencies: dependencies


	| hook |
	hook := self getHook: CMFReactHookUseMemo IfAbsent: [:node | CMFReactHookUseMemo new].
	
	hook 
		updateBlock: block;
		updateDependencies: dependencies.	
		
	^ hook get