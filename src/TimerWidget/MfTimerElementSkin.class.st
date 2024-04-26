Class {
	#name : #MfTimerElementSkin,
	#superclass : #ToRawSkin,
	#category : #TimerWidget
}

{ #category : #'event handling' }
MfTimerElementSkin >> installLookEvent: anEvent [
 	"when installing the skin, changes the properties of widget mentionned down here"
	super installLookEvent: anEvent.
	"anEvent elementDo: [ :e |
		e border: e defaultBorder.
		e background: e backgroundPaint  ]."
]
