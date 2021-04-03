hooks
getHook: CMFReactHookClass IfAbsent: aBlock

	| hook nodeId |
	nodeId := elementTree currentParentId.
	
	"Transcript showln: CMFReactHookClass shortName, ' ', nodeId, ' ',
		(String streamContents: [:s | elementTree currentNode printWithoutChildrenOn: s])."
	
	hook := (hooks at: nodeId ifAbsentPut: [OrderedCollection new]) 
		at: hookIndex 
		ifAbsentPut: [aBlock value: nodeId].
	"verify that the type of hook did not change between re-renders"
	self assert: hook class == CMFReactHookClass.
	hookIndex := hookIndex + 1.
	^ hook