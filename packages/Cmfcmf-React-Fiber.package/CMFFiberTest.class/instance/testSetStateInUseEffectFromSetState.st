tests - useEffect
testSetStateInUseEffectFromSetState

	| runs |
	runs := OrderedCollection new.
	self openComponentBlock: [ | state visible |
		visible := CMFReact useState: false.
		state := CMFReact useState: nil.
		{
			(self bubble: #Button) props: {#pressed -> [visible set: [:v | v not]]}.
			visible get ifTrue: [
				[
					CMFReact
						useEffect: [
							runs add: #effect.
							state set: true.
							[runs add: #cleanup]]
						dependencies: {state get}.
					nil] asComponent]}].
	((root findTag: #Button) props at: #pressed) value.
	((root findTag: #Button) props at: #pressed) value.
	self assert: #(#effect #cleanup #effect #cleanup) equals: runs asArray