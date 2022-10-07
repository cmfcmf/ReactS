helpers
diffPropsFrom: anOldNode to: aNewNode

	^ anOldNode props
		ifNotNil: [:oldProps | | changes |
			changes := Dictionary new.
			aNewNode props
				ifNotNil: [:newProps |
					"which props have a new value or were added?"
					newProps keysAndValuesDo: [:key :value | (oldProps at: key ifAbsent: nil) == value ifFalse: [changes at: key put: value]].
					
					"did some properties disappear?"
					newProps size = oldProps size ifFalse: [oldProps keysDo: [:key | (newProps includesKey: key) ifFalse: [changes at: key put: nil]]]]
				ifNil: ["all removed"
				oldProps keysDo: [:key | changes at: key put: nil]].
			changes ifEmpty: [nil]]
		ifNil: ["all new"
		aNewNode props ifNotNil: [:p | p copy ifEmpty: nil]]