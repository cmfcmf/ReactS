hooks
getHook: aCMFReactHookClass IfAbsent: aBlock

	| hook entry |
	self assert: hookIndex notNil.
	
	entry := elementTree currentParentEntry.
	hook := entry hooks at: hookIndex ifAbsentPut: [aBlock value: entry].
	
	"Transcript showln: CMFReactHookClass shortName, ' ', nodeId, ' ',
		(String streamContents: [:s | elementTree currentNode printWithoutChildrenOn: s])."
	
	"verify that the type of hook did not change between re-renders"
	self
		assert: hook class == aCMFReactHookClass
		description: 'Components must use the same hooks in the same order on every render'.
	hookIndex := hookIndex + 1.
	^ hook