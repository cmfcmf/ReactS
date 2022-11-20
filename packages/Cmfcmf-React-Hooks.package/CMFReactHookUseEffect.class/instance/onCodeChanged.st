lifecycle
onCodeChanged

	self rerunOnCodeChange ifTrue: [dependenciesInitialized := false]