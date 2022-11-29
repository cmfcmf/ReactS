as yet unclassified
updateFrameDo: aBlock

	| ret |
	queuedUpdates := OrderedCollection new.
	"if not nil, a previous attempt to update failed"
	batchedUpdates := batchedUpdates ifNil: [OrderedCollection new].
	
	self hostConfig updateFrameDo: [
		ret := aBlock value.
		[
			true
				ifTrue: ["rerendering just the fiber not the entire app still results in subtle reconciliation bugs during use. sadly haven't managed to isolate them in tests yet, so this is what we have for now. Note that re-rendering through contexts still works because memoized components consult this class to know whether they are forced to rerender."
				batchedUpdates ifNotEmpty: [self reRenderFiberNow: currentRoot]]
				ifFalse: [batchedUpdates do: [:hook | self reRenderFiberNow: hook fiber]].
			self performPendingEffects.
			batchedUpdates := queuedUpdates withoutDuplicates.
			queuedUpdates := OrderedCollection new] doWhileTrue: [batchedUpdates notEmpty]].
	batchedUpdates := nil.
	queuedUpdates := nil.
	^ ret