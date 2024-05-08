Class {
	#name : #MfDrumPadButtonElement,
	#superclass : #ToElement,
	#category : #'Mooflod-DrumPadWidget'
}

{ #category : #initialization }
MfDrumPadButtonElement >> initialize [

	super initialize.
	self geometry: BlCircleGeometry new.
	self background: Color lightBlue.

]
