Class {
	#name : #MfFractalCircleElementTheme,
	#superclass : #ToRawTheme,
	#category : #'Mooflod-FractalCircleWidget'
}

{ #category : #accessing }
MfFractalCircleElementTheme class >> defaultTokenProperties [
	"define here token properties of the widget theme"

	^ super defaultTokenProperties
	  ,
	  { (ToTokenProperty
		   name: #'background-color'
		   value: Color lightBlue) }
]
