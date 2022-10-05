as yet unclassified
updateFrameDo: aBlock

	| ret |
	self assert: batchedUpdates isNil.
	queuedUpdates := OrderedCollection new.
	batchedUpdates := OrderedCollection new.
	
	self hostConfig updateFrameDo: [
		ret := aBlock value.
		[
			batchedUpdates do: [:hook |
				SBToggledCode
					comment: ''
					active: 1
					do: {[self reRenderFiberNow: currentRoot]. [self reRenderFiberNow: hook fiber]}].
			self performPendingEffects.
			batchedUpdates := queuedUpdates.
			queuedUpdates := OrderedCollection new] doWhileTrue: [batchedUpdates notEmpty]].
	batchedUpdates := nil.
	queuedUpdates := nil.
	self assert: batchedUpdates isNil.
	^ ret