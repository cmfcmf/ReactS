as yet unclassified
key: key factory: aBlock children: children

	^ self new
		key: key;
		factoryBlock: aBlock;
		children: children;
		yourself