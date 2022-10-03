tests - useEffect
testUseEffectInUnmount

	| runs mounted |
	mounted := true.
	runs := OrderedCollection new.
	self openComponentBlock: [
		mounted ifTrue: [
			[
				CMFReact
					useEffect: [
						runs add: #effect.
						[runs add: #cleanup]]
					dependencies: {}] asComponent]].
	self assert: #(#effect) equals: runs asArray.
	mounted := false.
	react reRenderAll.
	self assert: #(#effect #cleanup) equals: runs asArray.
	react reRenderAll.
	self assert: #(#effect #cleanup) equals: runs asArray