reconciliation
updateFrameDo: aBlock

	^ GRReactCurrentSession value: session during: [super updateFrameDo: aBlock]