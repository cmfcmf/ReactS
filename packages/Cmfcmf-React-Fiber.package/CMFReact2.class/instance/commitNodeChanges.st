as yet unclassified
commitNodeChanges

	hostConfig prepareForCommit.
	workInProgress commitNodeChangesFor: self.
	
	workInProgressParent ifNil: [currentRoot := workInProgress] ifNotNil: [
		self assert: workInProgressParent child = workInProgress alternate.
		workInProgressParent child: workInProgress].
	
	workInProgressParent := nil.
	workInProgress := nil.
	
	hostConfig resetAfterCommit