as yet unclassified
resetToNodeWithId: id during: aBlock

	| oldLevel oldIndex nodeAndIndex treeNode index |
	oldLevel := currentLevel.
	oldIndex := currentIndex.
	
	^ [
		nodeAndIndex := currentLevel findNodeAndIndexById: id.
		self assert: nodeAndIndex notNil.
	
		treeNode := nodeAndIndex first.
		index := nodeAndIndex second. 

		currentLevel := treeNode parent.
		currentIndex := index.

		aBlock value: treeNode] ensure: [currentLevel := oldLevel. currentIndex := oldIndex]