Class {
	#name : #MfFilledSquareExamples,
	#superclass : #Object,
	#category : #'Mooflod-FilledSquareWidget'
}

{ #category : #'as yet unclassified' }
MfFilledSquareExamples class >> exampleSimpleFilledSquare [

	<script>
	| c |
	c := MfFilledSquareElement new.
	c setValue: 65.
	c openFilledSquare: c
]
