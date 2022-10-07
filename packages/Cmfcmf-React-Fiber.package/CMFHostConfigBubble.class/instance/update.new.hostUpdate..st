as yet unclassified
update: aHostNode new: aNewNode hostUpdate: aHostUpdate

	aHostUpdate keysAndValuesDo: [:key :value | aHostNode set: key to: value]