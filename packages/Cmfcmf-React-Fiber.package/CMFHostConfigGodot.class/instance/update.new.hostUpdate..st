reconciliation
update: aHostNode new: aNewNode hostUpdate: aHostUpdate

	aHostUpdate keysAndValuesDo: [:key :value |
		pendingUpdates add: {
			#update.
			aHostNode second, (aHostNode third ifTrue: [':'] ifFalse: ['/']), aHostNode fourth.
			key.
			aNewNode serializePropValue: value for: react}]