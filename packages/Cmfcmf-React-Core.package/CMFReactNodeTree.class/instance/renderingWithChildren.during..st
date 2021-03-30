as yet unclassified
renderingWithChildren: node during: aBlock

	| oldLevel oldIndex treeNodeFromLastRender result |
	
	oldLevel := currentLevel.
	
	treeNodeFromLastRender := currentLevel childNodeAt: currentIndex ifAbsent: [nil].
	oldIndex := currentIndex + 1.
	(treeNodeFromLastRender notNil and: [treeNodeFromLastRender node type == node type]) 
		ifTrue: [currentLevel := treeNodeFromLastRender]
		ifFalse: [currentLevel := currentLevel addChild: node].
	currentIndex := 1.
	
	result := aBlock value: (treeNodeFromLastRender ifNotNil: [:t | t renderResult]).
	
	currentLevel renderResult: result.
	
	currentLevel := oldLevel.
	currentIndex := oldIndex.
	
	^ result