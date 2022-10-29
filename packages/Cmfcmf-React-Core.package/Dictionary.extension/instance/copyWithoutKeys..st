*Cmfcmf-React-Core
copyWithoutKeys: aCollection

	| copy |
	copy := self copy.
	aCollection do: [:key | copy removeKey: key ifAbsent: []].
	^ copy