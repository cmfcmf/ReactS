reconciliation
removeChild: aHostNode in: aParentHostNode

	| path |
	path := aHostNode second, '/', aHostNode fourth.
	pendingUpdates add: {#delete. path. aHostNode fifth}