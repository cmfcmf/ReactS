as yet unclassified
commitNodeChanges

	
	parentFiber
		ifNil: [
			workInProgressRoot child ifNotNil: [:fiber | fiber commitNodeChangesFor: self].
			currentRoot := workInProgressRoot]
		ifNotNil: [
			workInProgressChild ifNotNil: [:fiber | fiber commitNodeChangesFor: self].
			parentFiber child: workInProgressChild].
	
	parentFiber := nil.
	workInProgressChild := nil.
	workInProgressRoot := nil