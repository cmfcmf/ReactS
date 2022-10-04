reconciliation
resetAfterCommit

	changesBlock ifNil: [^ self].
	
	false ifTrue: [pendingUpdates do: [:u | Transcript showln: u]].
	
	waitingRefs := pendingRefs collect: #second.
	changesBlock value: {pendingUpdates. pendingRefs collect: #first}.
	pendingUpdates removeAll.
	pendingRefs removeAll