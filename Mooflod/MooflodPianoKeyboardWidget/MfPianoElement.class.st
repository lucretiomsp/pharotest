Class {
	#name : #MfPianoElement,
	#superclass : #BlElement,
	#instVars : [
		'whiteKeyColor',
		'blackKeyColor',
		'nbOctaves'
	],
	#category : #MooflodPianoKeyboardWidget
}

{ #category : #'visual properties' }
MfPianoElement >> backgroundPaint [ 

	^ Color black.
]

{ #category : #'simple keyboard' }
MfPianoElement >> buildKeyboard [
]

{ #category : #initialization }
MfPianoElement >> initialize [
	"initialize the state of the receiver"

	super initialize.
	""

	whiteKeyColor := Color gray: 0.95.
	blackKeyColor := Color black.
	nbOctaves:= 2.
	self buildKeyboard.
]

{ #category : #'as yet unclassified' }
MfPianoElement >> openPiano: aPiano [
	| space |
	space := BlSpace new.
	space root
		background: Color lightBlue ;
		layout: BlFlowLayout horizontal.
	aPiano transformDo: [ :c |
		c translateBy: 200@200
		 ].
	space root addChild: aPiano .
	space show.
	^ space 



]

{ #category : #'as yet unclassified' }
MfPianoElement >> pianoExtent [

	^400@160.
]
