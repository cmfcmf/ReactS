hooks
getHook: aCMFReactHookClass ifAbsent: aBlock

	| hook entry |
	self assert: hookIndex notNil.
	
	entry := elementTree currentParentEntry.
	hook := entry hooks at: hookIndex ifAbsentPut: [aBlock value: entry].
	hook class == aCMFReactHookClass ifFalse: [CMFReactHooksChanged new signal].
	
	hookIndex := hookIndex + 1.
	^ hook