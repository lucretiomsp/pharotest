Class {
	#name : #MfMixingTableTheme,
	#superclass : #ToRawTheme,
	#category : #'Mooflod-MixingTableWidget'
}

{ #category : #accessing }
MfMixingTableTheme class >> defaultTokenProperties [
	"define here token properties of the widget theme"

	^ super defaultTokenProperties
	  ,
	  { (ToTokenProperty name: #'background-color' value: Color veryPaleRed ) }
]
