*Cmfcmf-React-Tests
resizeBy: aPoint

	(self findByClass: BottomRightGripMorph) morphs do: [ :morph | (self createWrapperFor: {morph}) dragBy: aPoint]