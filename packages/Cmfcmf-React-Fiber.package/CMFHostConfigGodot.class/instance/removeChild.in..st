reconciliation
removeChild: aHostNode in: aParentHostNode

	pendingUpdates add: {#delete. aHostNode second, '/', aHostNode fourth}