lifecycle
updateFrameDo: aBlock

	| ret |
	self assert: batchedUpdates isNil.
	
	queuedUpdates := Set new.
	batchedUpdates := Set new.
	ret := aBlock value.
	
	[
		batchedUpdates do: [:id | self reRenderNodeNow: id].
		self performRenderChanges.
		self performPendingEffects.
		batchedUpdates := queuedUpdates.
		queuedUpdates := Set new] doWhileTrue: [batchedUpdates notEmpty].
	
	batchedUpdates := nil.
	queuedUpdates := nil.
	
	self assert: batchedUpdates isNil.
	^ ret