*Cmfcmf-React-Core
asReactNodeBuilder: aCMFReactComponent

	self assert: ((aCMFReactComponent isKindOf: CMFReactComponent) or: [aCMFReactComponent isKindOf: CMFReactUITest]).

	^ CMFReactNodeComponentBuilder new
		privateElementClass: aCMFReactComponent class;
		privateSelector: self asSimpleSetter;
		yourself