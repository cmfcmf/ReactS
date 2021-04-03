*Cmfcmf-React-Core
asCMFReactNode

	^ TextMorph asReactNodeBuilder onRender: [:m | m contentsAsIs: self; readOnly: true]; build