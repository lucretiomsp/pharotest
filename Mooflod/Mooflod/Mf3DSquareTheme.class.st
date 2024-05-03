Class {
	#name : #Mf3DSquareTheme,
	#superclass : #ToRawTheme,
	#category : #'Mooflod-3DFilledSquareWidget'
}

{ #category : #accessing }
Mf3DSquareTheme class >> defaultTokenProperties [
	"define here token properties of the widget theme"

	^ super defaultTokenProperties
	  ,
	  { (ToTokenProperty name: #'background-color' value: Color lightGreen) }
]
