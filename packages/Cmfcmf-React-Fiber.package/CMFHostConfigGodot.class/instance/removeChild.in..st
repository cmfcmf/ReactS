reconciliation
removeChild: aHostNode in: aParentHostNode

	pendingUpdates add: {#delete. self fullPathFor: aHostNode. aHostNode fifth}