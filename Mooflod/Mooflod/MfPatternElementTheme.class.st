Class {
	#name : #MfPatternElementTheme,
	#superclass : #ToRawTheme,
	#category : #'Mooflod-PatternWidget'
}

{ #category : #accessing }
MfPatternElementTheme class >> defaultTokenProperties [
"define here token properties of the widget theme"
	^ super defaultTokenProperties , {
		  (ToTokenProperty
			   name: #'background-color'
			   value: (Color lightOrange   ))}.
]
