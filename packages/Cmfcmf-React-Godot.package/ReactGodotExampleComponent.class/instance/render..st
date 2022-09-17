rendering
render: props

	| count particles |
	count := self useState: 0.
	particles := {{#g. 54 @ 21}. {#x. 54 @ 21}. {#d. 54 @ 21}. {#f. 54 @ 21}. {#c. 12 @ 32}}.
	
	^ CMFReactNodeGodot new
		godotClass: #Spatial;
		position: 2 @ 3;
		children: (particles collect: [:position |
			CMFReactNodeGodot new
				godotClass: #Particle;
				key: position first;
				position: position second])