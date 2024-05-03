Class {
	#name : #MfFilledSquareElementTheme,
	#superclass : #ToRawTheme,
	#category : #'Mooflod-FilledSquareWidget'
}

{ #category : #accessing }
MfFilledSquareElementTheme class >> defaultTokenProperties [
	"define here token properties of the widget theme"

	^ super defaultTokenProperties
	  ,
	  { (ToTokenProperty name: #'background-color' value: Color lightRed) }
]
