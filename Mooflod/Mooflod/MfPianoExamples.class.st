Class {
	#name : #MfPianoExamples,
	#superclass : #Object,
	#category : #'Mooflod-PianoKeyboardWidget'
}

{ #category : #'as yet unclassified' }
MfPianoExamples class >> exampleDefaultPiano [

	<script>
	| p |
	p := MfPianoElement new startNote: 'B'.
	p openPiano: p
]
