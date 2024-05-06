Class {
	#name : #MfPianoWhiteNoteElement,
	#superclass : #ToElement,
	#classVars : [
		'note'
	],
	#category : #'Mooflod-PianoKeyboardWidget'
}

{ #category : #initialization }
MfPianoWhiteNoteElement >> initialize [

	super initialize.
	self size: 36 @ 130.
	self geometry: BlRectangleGeometry new.
	self border: (BlBorder paint: Color black width: 1)
]

{ #category : #accessing }
MfPianoWhiteNoteElement >> note [
^note
]

{ #category : #accessing }
MfPianoWhiteNoteElement >> note: aNote [

note:= aNote .
]
