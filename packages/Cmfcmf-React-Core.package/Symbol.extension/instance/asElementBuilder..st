*Cmfcmf-React-Core
asElementBuilder: aCMFReactComponent

	self assert: (aCMFReactComponent isKindOf: CMFReactComponent).

	^ CMFReactNodeComponentBuilder new
		privateElementClass: aCMFReactComponent class;
		privateSelector: self asSimpleSetter;
		yourself