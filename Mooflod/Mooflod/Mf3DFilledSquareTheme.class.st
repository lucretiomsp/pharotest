Class {
	#name : #Mf3DFilledSquareTheme,
	#superclass : #ToRawTheme,
	#category : #'Mooflod-3DFilledSquare'
}

{ #category : #accessing }
Mf3DFilledSquareTheme class >> defaultTokenProperties [
	"define here token properties of the widget theme"

	^ super defaultTokenProperties
	  ,
	  { (ToTokenProperty name: #'background-color' value: Color lightBlue) }
]
