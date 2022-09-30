as yet unclassified
onCodeChanged
	"as a heuristic, do not re-run effects that should only run on mount (i.e., that have no dependencies)"

	dependencies ifNotEmpty: [dependenciesInitialized := false]