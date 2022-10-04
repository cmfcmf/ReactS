as yet unclassified
updateFrameDo: aBlock

	| ret |
	self assert: batchedUpdates isNil.
	queuedUpdates := Set new.
	batchedUpdates := Set new.
	
	self hostConfig updateFrameDo: [
		ret := aBlock value.
		[
			batchedUpdates do: [:fiber | self reRenderFiberNow: fiber].
			self performPendingEffects.
			batchedUpdates := queuedUpdates.
			queuedUpdates := Set new] doWhileTrue: [batchedUpdates notEmpty]].
	batchedUpdates := nil.
	queuedUpdates := nil.
	self assert: batchedUpdates isNil.
	^ ret