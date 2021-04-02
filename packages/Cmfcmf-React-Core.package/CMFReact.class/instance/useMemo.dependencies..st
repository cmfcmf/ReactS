hooks
useMemo: block dependencies: dependencies


	| hook |
	hook := self getHook: CMFReactHookUseMemo IfAbsent: [:nodeId | CMFReactHookUseMemo new].
	
	hook 
		initBlock: block;
		updateDependencies: dependencies.	
		
	^ hook get