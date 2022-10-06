as yet unclassified
commitNodeChanges

	| result |
	hostConfig prepareForCommit.
	result := workInProgress.
	workInProgress := nil.
	result commitNodeChangesFor: self.
	
	attachNewFiber value: result.
	attachNewFiber := nil.
	
	hostConfig resetAfterCommit.
	
	^ result