Class {
	#name : #MfPianoBlackNoteElement,
	#superclass : #ToElement,
	#category : #'Mooflod-PianoKeyboardWidget'
}

{ #category : #initialization }
MfPianoBlackNoteElement >> initialize [

	super initialize.
	self size: 20 @ 75.
	self geometry: BlRectangleGeometry new.
	self constraintsDo: [ :e | e frame vertical alignTop ]
]
