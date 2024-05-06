Class {
	#name : #Mf3DSquareExamples,
	#superclass : #Object,
	#category : #'Mooflod-3DFilledSquareWidget'
}

{ #category : #'as yet unclassified' }
Mf3DSquareExamples class >> exampleSimple3DSquare [

	<script>
	| s |
	s := Mf3DFilledSquareElement new.
	s setValue: 20.
	s openSquare: s
]
