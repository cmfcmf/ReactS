*Cmfcmf-React-Core
asReactNodeBuilder

	^ CMFReactComponentBlockClosure asReactNodeBuilder
		privateBlockClosure: self;
		privateOverwrittenProps: {#__block -> self};
		yourself