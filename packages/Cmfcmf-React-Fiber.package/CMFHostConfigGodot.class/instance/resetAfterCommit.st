reconciliation
resetAfterCommit

	changesBlock ifNil: [^ self].
	
	false ifTrue: [
		Transcript showln: '------------'.
		pendingUpdates do: [:u | Transcript showln: u]].
	
	waitingRefs := pendingRefs collect: #second.
	changesBlock value: {pendingUpdates. pendingRefs collect: [:ref | self fullPathFor: ref first]}.
	pendingUpdates removeAll.
	pendingRefs removeAll