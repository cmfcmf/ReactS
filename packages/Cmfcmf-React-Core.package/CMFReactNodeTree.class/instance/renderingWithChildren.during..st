as yet unclassified
renderingWithChildren: node during: aBlock

	| oldId oldIndex treeNodeFromLastRender result |
	
	oldId := currentLevel id.
	
	treeNodeFromLastRender := currentLevel childTreeNodeAt: currentIndex ifAbsent: [nil].
	oldIndex := currentIndex + 1.
	(treeNodeFromLastRender notNil and: [treeNodeFromLastRender node type = node type]) 
		ifTrue: [
			currentLevel := treeNodeFromLastRender.
			currentLevel node: node]
		ifFalse: [currentLevel := treeNodeFromLastRender 
			ifNil: [currentLevel addChildNodeToTree: node]
			ifNotNil: [currentLevel replaceChildTreeNodeAt: currentIndex with: node]].
	currentIndex := 1.
	
	result := aBlock value: (treeNodeFromLastRender ifNotNil: [:t | t renderResult]).
	
	currentLevel renderResult: result.
	
	currentLevel := (rootEntry findTreeNodeAndIndexById: oldId) first.
	currentIndex := oldIndex.
	
	^ result