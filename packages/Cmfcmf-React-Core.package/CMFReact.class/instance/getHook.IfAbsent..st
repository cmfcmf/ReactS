hooks
getHook: aCMFReactHookClass IfAbsent: aBlock

	| hook nodeId |
	self assert: hookIndex notNil.
	
	nodeId := elementTree currentParentId.
	
	"Transcript showln: CMFReactHookClass shortName, ' ', nodeId, ' ',
		(String streamContents: [:s | elementTree currentNode printWithoutChildrenOn: s])."
	
	hook := (hooks at: nodeId ifAbsentPut: [OrderedCollection new]) 
		at: hookIndex 
		ifAbsentPut: [aBlock value: nodeId].
	"verify that the type of hook did not change between re-renders"
	self assert: hook class == aCMFReactHookClass description: 'Components must use the same hooks in the same order on every render'.
	hookIndex := hookIndex + 1.
	^ hook