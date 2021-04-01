as yet unclassified
resetToNodeWithId: id during: aBlock

	| oldId oldIndex nodeAndIndex treeNode index |
	oldId := currentLevel id.
	oldIndex := currentIndex.
	
	^ [
		nodeAndIndex := currentLevel findTreeNodeAndIndexById: id.
		self assert: nodeAndIndex notNil.
	
		treeNode := nodeAndIndex first.
		index := nodeAndIndex second. 

		currentLevel := treeNode parent.
		currentIndex := index.

		aBlock value: treeNode] ensure: [currentLevel := (rootEntry findTreeNodeAndIndexById: oldId) first. currentIndex := oldIndex]