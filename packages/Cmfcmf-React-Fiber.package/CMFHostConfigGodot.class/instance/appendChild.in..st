reconciliation
appendChild: aHostNode in: aParentHostNode

	aHostNode at: 2 put: (aParentHostNode fourth
		ifNotEmpty: [aParentHostNode second, (aParentHostNode third ifTrue: [':'] ifFalse: ['/']), aParentHostNode fourth]
		ifEmpty: ['']).
	pendingUpdates add: aHostNode