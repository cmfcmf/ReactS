as yet unclassified
isValueOutdatedBasedOnNodeTree: aCMFReactNodeTree

	^ lastValue ~~ (self getValueBasedOnNodeTree: aCMFReactNodeTree setLastValue: false)