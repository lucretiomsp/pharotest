Class {
	#name : #MfPatternElementTheme,
	#superclass : #ToRawTheme,
	#category : #PatternWidget
}

{ #category : #'as yet unclassified' }
MfPatternElementTheme class >> ahouioui [
]

{ #category : #accessing }
MfPatternElementTheme class >> defaultTokenProperties [
"define here token properties of the widget theme"
	^ super defaultTokenProperties , {
		  (ToTokenProperty
			   name: #'background-color'
			   value: (Color lightOrange   ))}.
]
