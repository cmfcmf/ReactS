tests - reconciliation
testReorderNodes

	| reorder components references |
	reorder := false.
	components := {(self bubble: #Hello) key: #hello. (self bubble: #World) key: #world}.
	self openComponentBlock: [reorder ifTrue: [components reversed] ifFalse: [components]].
	references := root children copy.
	self assert: {#Hello. #World} equals: (root children collect: #tag as: Array).
	
	reorder := true.
	react reRenderAll.
	self assert: {#World. #Hello} equals: (root children collect: #tag as: Array).
	references with: root children reversed do: [:prev :new | self assert: prev identical: new]