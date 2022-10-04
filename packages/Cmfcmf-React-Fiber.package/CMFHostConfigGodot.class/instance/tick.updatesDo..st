as yet unclassified
tick: aCollectionOfPendingCallbacks updatesDo: aBlock

	changesBlock := aBlock.
	aCollectionOfPendingCallbacks
		ifNotEmpty: [
			GRReactCurrentSession
				value: session
				during: [aCollectionOfPendingCallbacks do: [:callback | (callbacks get: callback first) valueWithArguments: callback allButFirst]]]
		ifEmpty: ["if there were no pending callbacks, it's a full update request"
		react reRenderAll]