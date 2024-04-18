Class {
	#name : #BaselineOfPatternRepresentation,
	#superclass : #BaselineOf,
	#category : #BaselineOfPatternRepresentation
}

{ #category : #baselines }
BaselineOfPatternRepresentation >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec package: 'PatternRepresentation'.
		]
]
