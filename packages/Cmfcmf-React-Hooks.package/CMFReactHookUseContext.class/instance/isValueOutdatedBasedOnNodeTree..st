private
isValueOutdatedBasedOnNodeTree: aCMFReactNodeTree

	^ lastValue ~~ (self getValueBasedOnNodeTree: aCMFReactNodeTree setLastValue: false)