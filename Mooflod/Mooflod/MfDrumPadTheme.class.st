Class {
	#name : #MfDrumPadTheme,
	#superclass : #ToRawTheme,
	#category : #'Mooflod-DrumPadWidget'
}

{ #category : #accessing }
MfDrumPadTheme class >> defaultTokenProperties [
	"define here token properties of the widget theme"

	^ super defaultTokenProperties
	  ,
	  { (ToTokenProperty name: #'background-color' value: Color veryPaleRed ) }
]
