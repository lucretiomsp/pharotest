Class {
	#name : #Mf3DEmptySquareTheme,
	#superclass : #ToRawTheme,
	#category : #'Mooflod-3DFilledSquare'
}

{ #category : #accessing }
Mf3DEmptySquareTheme class >> defaultTokenProperties [
	"define here token properties of the widget theme"

	^ super defaultTokenProperties
	  ,
	  { (ToTokenProperty name: #'background-color' value: Color lightGreen) }
]
