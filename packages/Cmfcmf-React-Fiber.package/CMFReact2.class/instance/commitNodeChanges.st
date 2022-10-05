as yet unclassified
commitNodeChanges

	hostConfig prepareForCommit.
	workInProgress changes.
	workInProgress commitNodeChangesFor: self.
	
	attachNewFiber value: workInProgress.
	workInProgress := nil.
	attachNewFiber := nil.
	
	hostConfig resetAfterCommit