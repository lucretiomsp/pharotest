Class {
	#name : #MfPianoElement,
	#superclass : #ToElement,
	#instVars : [
		'whiteKeyColor',
		'blackKeyColor',
		'noteArray'
	],
	#classVars : [
		'startNote'
	],
	#category : #'Mooflod-PianoKeyboardWidget'
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
	self border: (BlBorder paint: Color black width: 2).
	self geometry: BlRectangleGeometry new.
	self size: self pianoExtent.
	whiteKeyColor := Color gray: 0.95.
	blackKeyColor := Color black.
	self noteArray .
	self initializeNotes
]

{ #category : #initialization }
MfPianoElement >> initializeNotes [

	| wN wx bN bx wArray bxArray |
	wArray := #( 'C' 'D' 'E' 'F' 'G' 'A' 'B' 'C' 'D' 'E' 'F' 'G' 'A' 'B' ).
	wx := 0.
	bx := 0.
	1 to: 14 do: [ :i |
		wN := MfPianoWhiteNoteElement new.
		wN background: whiteKeyColor.
		wN note: (wArray at: i).
		self addChild: wN.
		wN transformDo: [ :e |
			e translateBy: wx @ 0.
			wx := wx + 36 ] ].

	1 to: 7 do: [ :e |
		startNote = (wArray at: e) ifTrue: [ bxArray := noteArray at: e ] ].

	1 to: bxArray size do: [ :i |
		bN := MfPianoBlackNoteElement new.
		bN background: blackKeyColor.
		self addChild: bN.
		bN transformDo: [ :e |
			bx := bx + (bxArray at: i).
			e translateBy: bx @ 0 ] ].

	^ bxArray
]

{ #category : #'as yet unclassified' }
MfPianoElement >> noteArray [

	| cA dA eA fA gA aA bA |
	cA := #( 26.5 36 67 40 39 68.5 36 68 41 40 ).
	dA := #( 28 65 40 39 68 40 70 39 39 ).
	eA := #( 60 39 39 68 36 70 39 39 68 ).
	fA := #( 24 39 39 68 36 70 39 39 68 36 ).
	gA := #( 26 39 68 36 70 39 39 68 36 ).
	aA := #( 29 68 36 70 39 39 68 36 70 ).
	bA := #( 62 36 70 39 39 68 36 70 39).
	noteArray := {
		             cA.
		             dA.
		             eA.
		             fA.
		             gA.
		             aA.
		             bA }.
	^ noteArray
]

{ #category : #'as yet unclassified' }
MfPianoElement >> openPiano: aPiano [

	| space |
	space := BlSpace new.
	space root
		background: Color lightRed ;
		layout: BlFlowLayout horizontal.
	aPiano transformDo: [ :c | c translateBy: 200 @ 200 ].
	space root addChild: aPiano.
	space show.
	^ space
]

{ #category : #'as yet unclassified' }
MfPianoElement >> pianoExtent [

	^ 505 @ 130
]

{ #category : #'as yet unclassified' }
MfPianoElement >> startNote [

^startNote 
]

{ #category : #'as yet unclassified' }
MfPianoElement >> startNote: aNote [

startNote := aNote
]

{ #category : #tests }
MfPianoElement >> test [

	"| wtWid bkWid keyRect octavePt nWhite nBlack |
	wtWid := 8.
	bkWid := 5.
	self size: 10 @ 10.
	1 to: nOctaves + 1 do: [ :i |
		i <= nOctaves
			ifTrue: [
				nWhite := 7.
				nBlack := 5 ]
			ifFalse: [
				nWhite := 1.
				nBlack := 0 ""High C"" ].
		octavePt := self bounds topLeft + (7 * wtWid * (i - 1) - 1 @ -1).
		1 to: nWhite do: [ :j |
			| val |
			keyRect := octavePt + (j - 1 * wtWid @ 0) extent: wtWid + 1 @ 36.
			val := i - 1 * 12 + (#( 1 3 5 6 8 10 12 ) at: j) ].
		self addChild: (ToElement new
				 position: keyRect;
				 background: whiteKeyColor;
				 width: 1).
		1 to: nBlack do: [ :j |
			| val |
			keyRect := octavePt + ((#( 6 15 29 38 47 ) at: j) @ 1) extent:
				           bkWid @ 21.
			val := i - 1 * 12 + (#( 2 4 7 9 11 ) at: j) ] ].
	self addChild: (ToElement new
			 position: keyRect;
			 background: blackKeyColor;
			 width: 1)"
]
