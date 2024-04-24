Class {
	#name : #MfPattern,
	#superclass : #Object,
	#classVars : [
		'name'
	],
	#category : #PatternRepresentation
}

{ #category : #initialization }
MfPattern >> initialize [ 

super initialize .
]

{ #category : #accessing }
MfPattern >> name [

^name.

]

{ #category : #accessing }
MfPattern >> name: aName [
	"Change the name of the pattern to the given name"
name := aName.
]
