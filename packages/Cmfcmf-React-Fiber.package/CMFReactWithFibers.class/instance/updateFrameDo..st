as yet unclassified
updateFrameDo: aBlock

	| ret |
	queuedUpdates := OrderedCollection new.
	"if not nil, a previous attempt to update failed"
	batchedUpdates := batchedUpdates ifNil: [OrderedCollection new].
	
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