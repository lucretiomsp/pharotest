Class {
	#name : #MfDrumPadsElement,
	#superclass : #ToElement,
	#classVars : [
		'keymap',
		'nbButtonPerRow',
		'nbButtons'
	],
	#category : #'Mooflod-DrumPadWidget'
}

{ #category : #adding }
MfDrumPadsElement >> addButton: anElement key: aKey [
	"add the key passed as parameter to the key dictionnary"

	keymap at: aKey put: anElement.
	self addChild: anElement
	
]

{ #category : #initialization }
MfDrumPadsElement >> defaultGeometry [
^ BlRectangleGeometry new
	
]

{ #category : #'as yet unclassified' }
MfDrumPadsElement >> initEventListeners [

	self addEventHandlerOn: BlKeyDownEvent do: [ :anEvent |
		keymap
			at: anEvent key name
			ifPresent: [ :aButton | aButton background: Color random ] ].
	self requestFocus
]

{ #category : #accessing }
MfDrumPadsElement >> initKeys [

	| keys |
	keys := #( Q W E R T Y U I O P ). keys do: [ :eachKey |
		        self addButton: MfDrumPadButtonElement new key: eachKey ].
	self initEventListeners
]

{ #category : #initialization }
MfDrumPadsElement >> initialize [

	super initialize.
	self geometry: self defaultGeometry.
	self size: self tableExtent.
	keymap:= Dictionary new.
	self background: Color black.
	self border: (BlBorder paint: Color blue width: 2).
	self layout: (BlGridLayout horizontal cellSpacing: 20).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]

{ #category : #accessing }
MfDrumPadsElement >> keymap [


^keymap
]

{ #category : #'as yet unclassified' }
MfDrumPadsElement >> nbButtonPerRow [

	^ nbButtonPerRow 
]

{ #category : #'as yet unclassified' }
MfDrumPadsElement >> nbButtonPerRow: rows [

	nbButtonPerRow  := rows.
	self layout columnCount: nbButtonPerRow 
]

{ #category : #'as yet unclassified' }
MfDrumPadsElement >> nbButtons [

^nbButtons 
]

{ #category : #'as yet unclassified' }
MfDrumPadsElement >> nbButtons: buttons [

	nbButtons := buttons.
	self initKeys
]

{ #category : #'as yet unclassified' }
MfDrumPadsElement >> openMixingTable: aTable [

	| space |
	space := BlSpace new.
	space root layout: BlFlowLayout horizontal.
	aTable transformDo: [ :c | c translateBy: 180 @ 150 ].
	space root addChild: aTable.
	space toTheme: MfDrumPadTheme new.
	space applyAllSkinInstallers.
	space show.
	^ aTable
]

{ #category : #'as yet unclassified' }
MfDrumPadsElement >> redefineKeys: keys [

	| v |
	v := keymap values.
	keymap := Dictionary new.
		keys withIndexDo: [ :key :index |
			| elem |
			elem := v at: index.
			keymap at: key put: elem ] .
	self initEventListeners
]

{ #category : #'as yet unclassified' }
MfDrumPadsElement >> tableExtent [

	^ 400 @ 200
]
