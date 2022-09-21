as yet unclassified
tick: aCollectionOfPendingCallbacks

	| currentPending allUpdates currentPendingRefs allPendingRefs |
	currentPending := (pendingUpdates ifNil: [#()]) copy.
	pendingUpdates := OrderedCollection new.
	currentPendingRefs := (pendingRefs ifNil: [#()]) copy.
	pendingRefs := OrderedCollection new.
	
	aCollectionOfPendingCallbacks do: [:callback | (callbacks at: callback first) valueWithArguments: callback allButFirst].
	
	allUpdates := currentPending, pendingUpdates.
	SBToggledCode comment: '' active: 0 do: {[allUpdates do: [:u | Transcript showln: u]]}.
	allPendingRefs := currentPendingRefs, pendingRefs.
	pendingUpdates := nil.
	pendingRefs := nil.
	waitingRefs := allPendingRefs collect: #second.
	^ {allUpdates. allPendingRefs collect: #first}